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

# FPGA debugging
-	functional definition error
	- 知不知道你要寫的是什麼，題目要求是什麼
-	functional system interaction problems
	-	單個module是對的，合起來是錯的
	-	檢測每個module的輸出，和鏈接
-	system-level timing issues
	-	asynchronous event
	-	real-world interactions，especiallly at speed
	-	有些system timing 很難模擬出來，如clk 和 rst 一起到，如果是synchronous rst，就不知道是這個clk edge reset 還是下一個clk edge reset
-	signal fidelity between ICs
	-	真實上，會有很多noise，cross-talk，reflection，loading，EMI
	- 穩定越高雜訊越多，雜訊越大reflection越大，reflection越大當機幾率越高
-	interconnect reliability issues
	-	實際操作上，訊號可能跑到其他地方
	- 要靠LED，test pettern， chipscope 來測
-	power supply issues
	-	rst的耗電量比平常大5～10
	-	好的設計，rst的耗電量要在3～5之前
	-	實際上不可能所有的module都有rst
	-	rst的耗電量太大，可能會rst不完全or燒掉
	-	可以的方法：分多個state rst
沒有一個最好的測試方法

#### instrument-controlled test mux
-	test mechine和FPGA形成close loop
-	test machine送特殊test pettern給FPGA
-	FPGA 送output回去給test machine
-	對比test machine和FPGA的output

#timing
-	數爲電路設計不能不管底層的東西
	-	爲了最佳化
-	所有的高階語言都不能發揮100%的戰鬥力除非對硬體的管控非常好

### what-why-how
-	要知道別人的設計是怎麼做的

### what's the real problem
-	不管寫軟體還是硬體都分
	-	designers
	-	tool developers
-	designer
	-	要over tool的限制
-	developer
	-	要比程式設計的人更懂程式設計

### digital system timing convention
-	寫程式最重要是平衡的
-	可以寫到module是同步的，module和module之間是非同步的，是很厲害的
-	1萬個gate count 的timing是對的，超過就不保證
-	synchronous
	-	壞處：容易發生碰撞
	-	好處：等效提高效能
	-	best path（最短路徑）沒有切好，就會發生資料碰撞
-	asynchronous
	-	必須要每1萬個gate切一刀，要寫ready訊號
	-	如果真的等ack才接受資料，可能ack不傳，然後就當機了
	-	沒有clk的情況：假設clk同源，但是相位有差

### metastability
-	setup time hold time
-	同步電路上會error，錯timing，非同步電路會錯cycle

### timing analysis
-	重點：每一個gate的delay，每一個module的delay
-	測量精準度，10倍可忽略，100倍可狀做不知道

###  estimate logic delay
-	gate 的後面都接gate當delay
-	gate delay 真真的delay不是propagation delay，是inertial delay

### issue of speed and area
-	design for high throughput
-	design for low latency
-	design for timing
- design for area

# 注
-	verilog 的 always@（negedge。。。||posedge。。。）是理想化的

# 作業小提示
-	check output port 有沒有放reg
-	如果出現Latch，注意是否case都有放default、if是否都有放else
-	如果FSM 的next state 的reg出現Latch，把blocking 換成 non-blocking，default 是否有放，default裏面，next state = 一個parameter，不要放next state=next state
