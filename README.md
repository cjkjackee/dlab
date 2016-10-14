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


