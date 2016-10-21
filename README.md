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

