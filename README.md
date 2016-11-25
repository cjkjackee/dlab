# Dlab

# Verilog to Synthesis

合成是在做最佳化
+	只有合成不代表最佳化

爲什麼需要合成？
+	會有很多的錯誤
+	提高生產力
+	*有最佳化的過程，沒有最佳化的結果*

Logic synthesis
+	3 logic gates
	*	對只有正logic的最佳化
+	6 basic CMOS gates
	*	讓timing，電流，電壓穩定
	*	原件沒有了
	*	因爲沒有pos logic 所以從neg logic 開始思考

速度>面積，先考慮速度，在速度的限制下，面積越小越好
<br />
Power 維持在一定限度就好。
+	現在的synthesis 沒有power 的設定檔

*用case比if更快（因爲case都是基本logic gate），盡量用case!*

# Introduction to RTL - test && debugging

bugs' type
+	unknown
+	timing error
	*	要分析結構是不是錯的
+	Function error
	*	常出現在assign然後有過多層的（）
+	Transition error
	*	線在亂抖
+	value error

check rules
+	latch inference
	*	RTL code 不能有latch
+	register inference
	*	register 在最佳化的時候可能會被刪掉
	*	code 判斷是特殊效果，合成不出來，會被移除
+	incomplete sensitivity list
	*	always@()裏面少寫1個或多寫
+	2-D memory array
	*	可以寫出來
	*	合成出來的速度很慢
	*	燒到IC裏面會產生而外的耗電量
	*	除非很必要，否則不要寫這個
+	mux/priority-encoder inference
+	the non-inferable RTL
	*	pin腳少接

8bit-8bit的除法器testbench
+	分母是0,分子全測&&分子是0,分母全測

timing model and activity analysis
+	開始會檢測fan-in 或 fan-out

data expansion
+	可以知道內部的結構有沒有出錯

mapping
+	加成output port

unknow tracing
+	看log檔找第一個unknow
+	把unknow tree 找出來（看unknow影響了什麼）

value tracing
+	從error的結果往後一級一級找
+	“what if” analysis
	*	找出pattern和code的關系
	*	什麼input會有什麼output
+	“how can” analysis
	*	有那些pattern可能會出現問題
	*	擴張test pattern

coding guidelines
-	定下變數名稱

suggested coding style
-	切成不同小區塊
-	formal port mapping：有多少個port去排列
-	[7：0]這類的const，用parameter來取代

general coding guidelines
-	一行80個字
	+	標準的editor一行80個字
-	盡量不要用非同步reset
-	不能mix module 和 code

non-synthesizable verilog
-	不能合成delay
	+	因爲有delay可是不會有精準的delay

# partition for synthesis

-	很精準的告訴合成軟體架構是怎樣的，而always不能精準的告訴軟體
	+	所以要切多個module
-	把module切出來後就可以知道他天生最佳化有的問題
-	1萬個gate的效率比較好，而且人最多能handle不超過1萬的gate，所以最大1
	萬
-	軟體一次就拿250gate，所以最小250個
-	因爲切了不同的module，可以對不同的module下不同的最佳化
-	暫存器在FSM的input，output沒有對齊;在output，output都是對齊的。
	+	盡量output對齊
-	glue logic
	+	某個input是與別人相反的，所以直接以～來接
	+	gate level是放一個反相器進來，可是這個反相器不知道是屬於哪個
		module的
-	combinational 沒有 hierarchy 的架構
-	所有output都要reg

# intro to FPGA

-	出現的重點不是量產，在於減少生產成本
-	IC不是便宜的生意，但是做出來要量大，便宜才可以用
-	現在最高單價的硬體是FPGA（70萬-120萬）

Digital logic
-	full custom
	+	全制定
-	ASICs
	+	gate array：先把電晶體做好，再根據需求做出gate
	+	standard cells：standard library
-	以上兩種做好了就回不去了
-	programmable logic devices
-	standard logic
	+	更低成本的設計
	+	TTL 74XX：面包板

FPGA
-	Field Programmable Gate Array
-	power 不能亂拔
-	晶片不要亂摸
-	hardware/software co-designs
-	EDA supporting
-	速度50M-100M
-	logic block == logic element

SPLD
-	有PAL，PLA
-	速度不高，10M
-	復雜度不高

CPLD
-	多個block以bus接起來

# coding style to FPGA

-	FPGA不一定要reset
-	counter不寫==，寫>= （防止counter永遠動不到==的value的情況）
-	穩態電路：什麼狀態就會一直持續這個狀態
-	單穩態電路：給你一個電流，現在不會時狀態改變，但是只要時間夠久，狀態就會改變（所有verilog寫的電路，除了無穩態）
-	無穩態電路：震蕩器，可以用來做clk或亂數產生器
-	reset的重點：強迫電路，在時間一致的情況下，回到大家的初始值
-	以最慢的clk來設定reset
-	if-else在verilog是個不好的寫法
-	FPGA建議是用case
	-	default不一定有用，是化簡的建議的答案而已


# 注
-	verilog 的 always@（negedge。。。||posedge。。。）是理想化的

# 作業小提示
-	check output port 有沒有放reg
-	如果出現Latch，注意是否case都有放default、if是否都有放else
-	如果FSM 的next state 的reg出現Latch，把blocking 換成 non-blocking，default 是否有放，default裏面，next state = 一個parameter，不要放next state=next state
