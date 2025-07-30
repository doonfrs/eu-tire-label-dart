import 'package:eu_tire_label/src/enums.dart';
import 'package:eu_tire_label/src/eu_tire_label.dart';

/// Generator for EU tire labels in SVG format
class LabelGenerator {
  static const String _ec1222Template = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 75 110" width="600" height="880">
	<title><![CDATA[[TITLE]]]></title>
	<style>
		text { font-family: Helvetica, Arial, sans-serif; }
	</style>
	<rect x="0" y="0" width="75" height="110" fill="white" stroke="#0059ae" stroke-width="0.35" />
	<g transform="translate(5,5)" fill="#0059ae">
		<path d="m 20.553125,8.0340853 c -0.354303,0.086553 -0.690914,0.2650662 -1.0125,0.534375 -1.984915,1.6660527 -2.931373,6.1359097 -2.109375,9.9843747 0.498181,2.333883 1.381004,3.952986 2.390625,4.44375 0.03086,0.0052 0.05266,3.71e-4 0.05625,0 0.963644,0.01558 2.463044,-0.01448 3.31875,-0.253125 0.334598,-0.09323 0.60075,-0.312558 0.759375,-0.478125 1.185417,-1.284247 1.827288,-4.316819 1.715625,-7.36875 l -1.29375,0 c 0.08619,2.311308 -0.268155,4.623379 -0.928125,5.596875 -0.807622,1.190373 -1.750486,-0.06822 -2.109375,-2.8125 -0.360251,-2.745636 0.0084,-5.953252 0.815625,-7.14375 C 22.435209,10.124983 22.717763,10.037103 23,10.171585 l 0,-1.7999997 -1.771875,-0.253125 c 0,0 0.07095,-0.056304 0.28125,-0.084375 l -0.95625,0 z"/>
		<g stroke="black" stroke-width="0.18" stroke-dasharray="0.75 0.75">
			<line x1="6.5" y1="29.375" x2="36" y2="29.375" />
			<line x1="6.5" y1="34.875" x2="36" y2="34.875" />
			<line x1="6.5" y1="40.375" x2="36" y2="40.375" />
			<line x1="6.5" y1="45.875" x2="36" y2="45.875" />
			<line x1="6.5" y1="51.375" x2="36" y2="51.375" />
			<line x1="6.5" y1="56.875" x2="36" y2="56.875" />
			<line x1="6.5" y1="62.375" x2="36" y2="62.375" />
		</g>
		<g stroke="none">
			<path d="m 0.1 27.0 h 4.75 l 2.375,2.375 l -2.375,2.375 h -4.75 z" fill="#039542" />
			<path d="m 0.1 32.5 h 7.125 l 2.375,2.375 l -2.375,2.375 h -7.125 z" fill="#a8cf15" />
			<path d="m 0.1 38.0 h 9.5 l 2.375,2.375 l -2.375,2.375 h -9.5 z" fill="#ffff00" />
			<path d="m 0.1 43.5 h 11.875 l 2.375,2.375 l -2.375,2.375 h -11.875 z" fill="#f6ba00" />
			<path d="m 0.1 49.0 h 14.25 l 2.375,2.375 l -2.375,2.375 h -14.25 z" fill="#f6ba00" />
			<path d="m 0.1 54.5 h 16.625 l 2.375,2.375 l -2.375,2.375 h -16.625 z" fill="#cc0000" />
			<path d="m 0.1 60.0 h 19.0 l 2.375,2.375 l -2.375,2.375 h -19.0 z" fill="#cc0000" />
			<g fill="white" font-size="4.5" font-weight="bold">
				<text x="1.250" y="31.0">A</text>
				<text x="3.625" y="36.5">B</text>
				<text x="6.000" y="42.0">C</text>
				<text x="8.375" y="47.5">D</text>
				<text x="10.750" y="53.0">E</text>
				<text x="13.125" y="58.5">F</text>
				<text x="15.500" y="64.0">G</text>
			</g>
		</g>
		<g display="[FUEL-EFFICIENCY-DISPLAY]" transform="translate(36,[FUEL-EFFICIENCY-Y])" fill="black">
			<path d="m 0 0 v 10 h -11 l -5 -5 l 5 -5 z"/>
			<text x="-9" y="8.5" font-size="10" fill="white" font-weight="bold">[FUEL-EFFICIENCY]</text>
		</g>
		<path d="m 14,0 c -2.209139,0 -4,1.7908612 -4,4 l 0,17.75 -10,0 L 0,70 36,70 36,4 C 36,1.790861 34.209139,0 32,0 L 14,0 z m 0,1.25 18,0 c 1.518783,0 2.75,1.231217 2.75,2.75 l 0,19 0.90625,0 0,45.75 -35.3125,0 0,-45.75 10.90625,0 0,-19 c 0,-1.518783 1.231217,-2.75 2.75,-2.75 z" />
	</g>
			<g transform="translate(43.5,5)" fill="#0059ae">
		<g stroke="black" stroke-width="0.18" stroke-dasharray="0.75 0.75">
			<line x1="6.5" y1="29.375" x2="26" y2="29.375" />
			<line x1="6.5" y1="34.875" x2="26" y2="34.875" />
			<line x1="6.5" y1="40.375" x2="26" y2="40.375" />
			<line x1="6.5" y1="45.875" x2="26" y2="45.875" />
			<line x1="6.5" y1="51.375" x2="26" y2="51.375" />
			<line x1="6.5" y1="56.875" x2="26" y2="56.875" />
			<line x1="6.5" y1="62.375" x2="26" y2="62.375" />
			<g fill="black" stroke="none" font-size="4.5" font-weight="bold">
				<text x="1.5" y="31.0">A</text>
				<text x="1.5" y="36.5">B</text>
				<text x="1.5" y="42.0">C</text>
				<text x="1.5" y="47.5">D</text>
				<text x="1.5" y="53.0">E</text>
				<text x="1.5" y="58.5">F</text>
				<text x="1.5" y="64.0">G</text>
			</g>
		</g>
		<g display="[WET-GRIP-DISPLAY]" transform="translate(26,[WET-GRIP-Y])" fill="black">
			<path d="m 0 0 v 10 h -11 l -5 -5 l 5 -5 z"/>
			<text x="-9" y="8.5" font-size="10" fill="white" font-weight="bold">[WET-GRIP]</text>
		</g>
		<path d="m 4,0 c -2.209139,0 -4,1.790861 -4,4 l 0,66 26,0 0,-66 c 0,-2.209139 -1.790861,-4 -4,-4 l -18,0 z m 0,1.25 18,0 c 1.518783,0 2.75,1.231217 2.75,2.75 l 0,19 0.90625,0 0,45.75 -25.3125,0 0,-45.75 0.90625,0 0,-19 c 0,-1.5187832 1.231217,-2.75 2.75,-2.75 z" />
	</g>
	<g transform="translate(15,77.25)" fill="#0059ae">
		<g fill="none" stroke="black" stroke-linecap="round">
			<path stroke-width="2" d="m 24.604083,4.701693 c 1.366132,1.9563212 2.19301,4.5156352 2.19301,7.315105 0,2.783602 -0.817545,5.328906 -2.169008,7.281509 M 22.19905,6.7142867 c 1.047835,1.3791998 1.690831,3.2435126 1.690831,5.2961103 0,2.032863 -0.63086,3.881442 -1.661627,5.257178 M 19.881628,8.7098122 c 0.73127,0.8054109 1.192649,1.9840578 1.192649,3.2975178 0,1.286792 -0.44271,2.44437 -1.147845,3.24778" />
			<g stroke="white" stroke-width="1.5">
				<path display="[ROLLING-NOISE-1-DISPLAY]" d="m 19.881628,8.727352 c 0.73127,0.805411 1.192649,1.984058 1.192649,3.297518 0,1.286789 -0.44271,2.444366 -1.147845,3.247778" />
				<path display="[ROLLING-NOISE-2-DISPLAY]" d="m 22.19905,6.7233568 c 1.047835,1.3791998 1.690831,3.2435126 1.690831,5.2961102 0,2.032859 -0.63086,3.88144 -1.661627,5.257176" />
				<path display="[ROLLING-NOISE-3-DISPLAY]" d="m 24.604083,4.7016939 c 1.366132,1.9563212 2.19301,4.5156352 2.19301,7.3151061 0,2.783598 -0.817545,5.328903 -2.169008,7.281506" />
			</g>
		</g>
		<g display="[ROLLING-NOISE-DB-DISPLAY]" transform="translate(54.5,7)" fill="black">
			<path d="m 0 0 v 10 h -20.25 l -5 -5 l 5 -5 z" />
			<text x="-3" y="8" text-anchor="end" fill="white" font-size="5" font-weight="bold"><tspan font-size="8">[ROLLING-NOISE-DB]</tspan> dB</text>
		</g>
		<path d="m 4,0 c -2.209139,0 -4,1.790861 -4,4 l 0,16 c 0,2.209139 1.790861,4 4,4 l 50.5,0 0,-24 -28.5,0 -22,0 z m 22,0.34375 27.25,0 0,23.3125 -27.25,0 L 26,22.75 4,22.75 c -1.518783,0 -2.75,-1.231217 -2.75,-2.75 l 0,-16 c 0,-1.518783 1.231217,-2.75 2.75,-2.75 l 22,0 0,-0.90625 z" />
	</g>
	<g transform="translate(5,100)">
		<text x="11" y="6" fill="black" font-size="3">1222/2009 - <tspan font-weight="bold">[TIRE-CLASS]</tspan></text>
	</g>
</svg>''';

  static const String _eu2020Template = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 75 110" width="600" height="880">
	<title><![CDATA[[TITLE]]]></title>
	<style>
		text { font-family: Verdana, Arial, sans-serif; }
		text.calibri { font-family: Calibri, Arial, sans-serif; }
		tspan.active { font-size: 5.644px; font-weight: bold; }
	</style>
	<defs>
		<g id="EU-star">
			<g id="c">
				<path id="t" d="M 0,0 v 1 h 0.5 z" transform="translate(0,-1) rotate(18)" />
				<use xlink:href="#t" transform="scale(-1,1)" />
			</g>
			<use xlink:href="#c" transform="rotate(72)" />
			<use xlink:href="#c" transform="rotate(144)" />
			<use xlink:href="#c" transform="rotate(216)" />
			<use xlink:href="#c" transform="rotate(288)" />
		</g>
		<g id="snowflake">
			<circle r="1" />
			<g id="a" fill="white" stroke="black" stroke-width="0.4">
				<path d="M 3.2,1 L 2.2,0 3.2,-1" />
				<path d="M 0,0 H 3.5" />
			</g>
			<use xlink:href="#a" transform="rotate(60)" />
			<use xlink:href="#a" transform="rotate(120)" />
			<use xlink:href="#a" transform="rotate(180)" />
			<use xlink:href="#a" transform="rotate(240)" />
			<use xlink:href="#a" transform="rotate(300)" />
		</g>
		<g id="tire">
			<path fill="black" stroke="none" d="M 2.984375,-11.720703 C 1.3359693,-11.720703 0,-9.1279645 0,-5.9296875 c 0,3.1982771 1.3359693,5.79101562 2.984375,5.79101562 h 3.5039062 c 1.6484058,10e-9 2.9843748,-2.59273852 2.9843748,-5.79101562 0,-3.198277 -1.335969,-5.7910155 -2.9843748,-5.7910155 z m 3.9375,1.662109 c 0.9168098,0 1.660156,1.7920797 1.660156,4.0039065 0,2.2118268 -0.7433462,4.0058594 -1.660156,4.0058594 -0.9168098,0 -1.6601562,-1.7940326 -1.6601562,-4.0058594 -2e-7,-2.2118268 0.7433464,-4.0039065 1.6601562,-4.0039065 z m -0.1484375,0.2597659 c -0.4305744,0 -0.8117504,0.5268808 -1.0703125,1.3398437 l 0.029297,-0.050781 c 0.5060049,0 0.9160156,1.3174885 0.9160156,2.6699218 0,1.324416 -0.3934564,2.3967166 -0.8847656,2.4414063 0.2561307,0.704485 0.6129659,1.1445313 1.0097656,1.1445313 0.7797514,0 1.4121095,-1.6878258 1.4121095,-3.7714844 0,-2.0836586 -0.6323581,-3.7734375 -1.4121096,-3.7734377 z" />
			<path fill="none" stroke="white" stroke-width="0.1215" d="m 3.1790138,-6.5253548 -0.8456876,-0.06038 m 0.8271662,1.0883181 -0.8768036,-0.037043 m 0.9390355,0.9868208 -0.8686541,-0.053342 M 3.3242217,-3.782705 2.4889061,-3.823452 m 1.0279382,0.9175506 -0.8497623,-0.055194 m 1.0823912,0.6463972 -0.8430946,-0.039636 m 1.078687,0.603798 -0.8931024,-0.071863 m 1.1579585,0.5504563 H 3.3890466 m 1.134992,0.39487649 -0.8386495,0.0222257 m 1.1709236,0.32782895 -0.8453172,0.0174101 M 3.3023664,-7.6729414 2.4314897,-7.6973896 M 3.4590575,-8.5064048 H 2.6381886 m 1.0523865,-0.737893 -0.8905093,0.014076 M 3.861713,-9.787716 H 3.0449188 m 1.0835025,-0.457849 H 3.252729 m 1.9251154,9.9860032 -0.7856782,0.0307455 M 4.3540121,-10.625625 h -0.866802 m 1.1327694,-0.357833 H 3.7579931 m 1.111655,-0.283748 -0.846058,-0.01741 m 1.2072255,-0.257818 -0.8768035,0.0074 M 6.0797268,0.02518954 c -1.6269207,0 -2.9167516,-2.66041534 -2.9167516,-5.89277184 0,-3.2323564 1.3187243,-5.9383347 2.945645,-5.9383347 M 5.2036641,4.224e-7 c -1.6269206,0 -2.9167516,-2.6607857224 -2.9167516,-5.8931422224 0,-3.2323565 1.3187244,-5.9379642 2.945645,-5.9379642 m 1.5858031,11.7672446 c -1.666186,0 -2.9604622,-2.6052215 -2.9604622,-5.837578 0,-3.231986 1.2320442,-5.8446166 2.8982303,-5.8446166 m -5.1147261,5.1870293 -0.8801374,-0.06038 m 0.8608751,1.0883181 -0.9123646,-0.037043 M 1.6869653,-4.581681 0.7831205,-4.634652 m 1.0090464,0.8182759 -0.8690246,-0.040747 m 1.0697967,0.9175506 -0.8842122,-0.055194 m 1.1264722,0.6463972 -0.8775444,-0.039636 m 1.1227679,0.603798 -0.9297748,-0.072234 M 2.7560211,-1.305614 H 1.8599552 m 1.1812956,0.39487649 -0.8730993,0.0222257 m 1.2187088,0.32745852 -0.879767,0.0174101 M 1.7695708,-7.7066133 0.8631329,-7.7310613 m 1.0694263,-0.8090152 h -0.853837 m 1.0949857,-0.737893 -0.9264409,0.014076 m 1.1046169,-0.557124 H 1.5017512 M 2.629705,-10.279237 H 1.7180812 m 2.0036462,9.9860033 -0.8175351,0.0303751 M 2.8641861,-10.659296 H 1.9621934 M 3.140896,-11.01713 H 2.2437189 m 1.1572177,-0.283748 -0.8805079,-0.01741 m 1.256122,-0.257818 -0.9123646,0.0078 m 1.7960598,11.55967544 c -1.6932273,0 -3.0356591,-2.66041534 -3.0356591,-5.89277184 0,-3.2323564 1.3728069,-5.9379636 3.0660342,-5.9379636 M 3.7482517,-0.03419011 c -1.6928569,0 -3.0352887,-2.66041529 -3.0352887,-5.89240139 0,-3.2323565 1.3724365,-5.9383345 3.0656638,-5.9383345" />
		</g>
	</defs>
	<rect width="75" height="110" fill="white" />
	<g id="header" transform="translate(3,3)">
		<g id="EU-flag">
			<rect width="16" height="11" fill="#0059ae" />
			<g fill="#ffff00" transform="scale(0.6) translate(13.5,9)">
				<use xlink:href="#EU-star" y="6"/>
				<use xlink:href="#EU-star" transform="rotate(30) translate(0,6) rotate(330)"/>
				<use xlink:href="#EU-star" transform="rotate(60) translate(0,6) rotate(300)"/>
				<use xlink:href="#EU-star" x="-6"/>
				<use xlink:href="#EU-star" transform="rotate(120) translate(0,6) rotate(240)"/>
				<use xlink:href="#EU-star" transform="rotate(150) translate(0,6) rotate(210)"/>
				<use xlink:href="#EU-star" y="-6"/>
				<use xlink:href="#EU-star" transform="rotate(210) translate(0,6) rotate(150)"/>
				<use xlink:href="#EU-star" transform="rotate(240) translate(0,6) rotate(120)"/>
				<use xlink:href="#EU-star" x="6"/>
				<use xlink:href="#EU-star" transform="rotate(300) translate(0,6) rotate(60)"/>
				<use xlink:href="#EU-star" transform="rotate(330) translate(0,6) rotate(30)"/>
			</g>
		</g>
		<g id="energy" transform="translate(18,1.7)" fill="#0059ae">
			<path d="m 1.59203,1.5435132 v 1.458979 H 5.0179754 V 4.4953603 H 1.59203 V 6.1706007 H 5.1647118 V 7.6634688 H 0.02474559 V 0.016756 H 5.1647118 v 1.5267572 z" />
			<path d="M 12.592823,0.01665099 V 7.6637132 H 10.721585 L 7.576884,2.5806947 V 7.6637132 H 6.0095996 V 0.01665099 H 7.880838 L 11.025539,5.1681464 V 0.01665099 Z" />
			<path d="m 15.050028,1.5435132 v 1.458979 h 3.425945 V 4.4953603 H 15.050028 V 6.1706007 H 18.62271 V 7.6634688 H 13.482744 V 0.01675599 H 18.62271 V 1.5435132 Z" />
			<path d="M 19.433984,7.6636064 V 0.01654418 h 3.60727 c 0.420295,0 0.780847,0.04192469 1.081656,0.12507531 0.30081,0.0838494 0.548515,0.21905647 0.744513,0.40492256 0.19495,0.18621547 0.33959,0.43322173 0.43392,0.74101875 0.09328,0.3074477 0.140448,0.6816255 0.140448,1.1225334 0,0.2431632 -0.01572,0.4747971 -0.04507,0.6945523 -0.0304,0.2208033 -0.07127,0.4181987 -0.123678,0.5932342 -0.06813,0.1977448 -0.188661,0.3682385 -0.360552,0.5125293 0.149881,0.1593138 0.260981,0.3497217 0.332253,0.5698263 0.07127,0.2201046 0.106908,0.4636171 0.106908,0.7294895 V 7.6636064 H 23.7393 V 5.6805689 c 0,-0.2885816 -0.06708,-0.485977 -0.202287,-0.5925355 C 23.401806,4.9818242 23.18799,4.9283702 22.894517,4.9283702 H 21.01175 v 2.7352362 z m 1.577766,-4.216575 h 1.769571 c 0.225345,0 0.409813,-0.015372 0.552357,-0.045418 0.142544,-0.030745 0.248404,-0.068826 0.315484,-0.1145942 0.113196,-0.091186 0.169794,-0.32282 0.169794,-0.6945522 0,-0.4181987 -0.03459,-0.6956004 -0.101667,-0.832205 -0.06813,-0.1519769 -0.28928,-0.2277907 -0.665554,-0.2277907 H 21.01175 Z" />
			<path d="m 28.913714,3.4471711 h 3.66282 c 0.03773,0.2889309 0.05765,0.5030962 0.06184,0.6435439 0.0042,0.140797 0.0052,0.2644749 0.0052,0.3703347 v 0.626774 c 0,0.5925355 -0.0828,1.1169434 -0.247355,1.5732237 -0.10586,0.2885816 -0.279848,0.5146255 -0.524059,0.6777824 -0.244561,0.1635063 -0.576814,0.2718117 -0.998157,0.3249163 -0.225345,0.022709 -0.458027,0.038082 -0.698046,0.045418 -0.241067,0.00734 -0.481435,0.011529 -0.721454,0.011529 -1.20219,0 -2.029504,-0.1939017 -2.480194,-0.5813556 C 26.485925,6.7368612 26.241714,5.9427379 26.241714,4.7573174 V 4.2786773 c 0,-0.1596632 0.0042,-0.32282 0.01153,-0.48982 V 2.8885247 c 0,-0.9876757 0.199143,-1.7171652 0.597427,-2.18811909 0.210672,-0.24316317 0.497856,-0.42553554 0.861902,-0.54711712 0.364745,-0.12123221 0.794473,-0.182023 1.29128,-0.182023 h 0.416103 c 0.135207,0 0.274606,0.0034937 0.4175,0.01083054 h 0.180276 0.203334 0.405622 c 0.735778,0.02305858 1.252849,0.22289957 1.549466,0.59847486 0.296617,0.37627403 0.44545,0.91011501 0.44545,1.60152291 v 0.6721924 h -1.577766 c 0,-0.6383033 -0.04192,-1.0372865 -0.124726,-1.1969497 -0.03773,-0.075814 -0.194949,-0.1212322 -0.4727,-0.1366046 -0.232682,-0.014674 -0.460124,-0.024456 -0.682674,-0.02795 -0.221153,-0.00384 -0.452787,-0.00594 -0.692805,-0.00594 -0.578561,0 -0.920247,0.060791 -1.025059,0.1823724 -0.10586,0.1292677 -0.165602,0.5506108 -0.180276,1.2650773 0,0.075814 -0.0021,0.1477845 -0.0063,0.2162615 -0.0031,0.068128 -0.0052,0.1446401 -0.0052,0.2277907 v 0.4335711 l 0.01153,0.9681109 c 0,0.1977447 0.0073,0.3843095 0.02201,0.5586464 0.01467,0.1750355 0.04088,0.3343493 0.07861,0.4786401 V 5.794604 c 0.03773,0.0835 0.09747,0.1579163 0.180276,0.2225502 0.0828,0.064634 0.203335,0.107956 0.360553,0.1306652 0.165602,0.023059 0.319675,0.033889 0.462219,0.033889 0.09014,0.00804 0.182373,0.011879 0.276703,0.011879 h 0.275655 0.394441 c 0.263078,0 0.475845,-0.00978 0.637255,-0.028648 0.161411,-0.018517 0.272511,-0.059044 0.332254,-0.1198347 0.104811,-0.091186 0.158265,-0.3947908 0.158265,-0.9115125 V 4.9512191 h -2.130123 z" />
			<path d="m 34.780587,-0.01776211 h 1.739176 l -0.69071,2.19825091 1.8929,-0.310592 -2.71113,5.9222108 0.81823,-4.2927382 -1.815688,0.077561 z" />
		</g>
		<a href="[QR-CODE-HREF]" target="_blank">
			<g id="QR-code" fill="black" transform="translate(58,0) scale(0.37931,0.37931)">
				<rect width="29" height="29" fill="white" />
				[QR-CODE]
			</g>
		</a>
	</g>
	<g transform="translate(3,21)">
		<text x="0" y="-1" font-size="2.46944" font-weight="bold"><![CDATA[[TRADEMARK]]]></text>
		<text x="69" y="-1" font-size="2.46944" text-anchor="end" text-align="end"><![CDATA[[TIRE-TYPE]]]></text>
		<line x1="0" y1="0" x2="69" y2="0" stroke="black" stroke-width="0.1764" />
	</g>
	<g transform="translate(3,28)">
		<text x="0" y="-1" font-size="3.52778"><![CDATA[[TIRE-SIZE-DESIGNATION]]]></text>
		<text x="69" y="-1" font-size="2.46944" text-anchor="end" text-align="end"><![CDATA[[TIRE-CLASS]]]></text>
		<line x1="0" y1="0" x2="69" y2="0" stroke="black" stroke-width="0.1764" />
	</g>
	<g id="fuel-efficiency" transform="translate(3,30)">
		<g transform="translate(7.7,0)">
			<use xlink:href="#tire" x="0" y="14" />
			<path fill="none" stroke="black" stroke-width="0.296343" d="m 15.640737,2.3906315 h 0.583795 v -0.795309 h -0.583795 m -4.552155,6.747091 v -7.634896 c 0,-0.308937 0.271894,-0.559346 0.607132,-0.559346 h 3.299774 c 0.335238,0 0.607132,0.250409 0.607132,0.559346 v 7.634896 m -4.989297,0 h 5.464186 m -1.438373,-5.349354 h -2.507799 c -0.240778,0 -0.435623,-0.179657 -0.435623,-0.401173 v -1.483195 c 0,-0.221516 0.194845,-0.401174 0.435623,-0.401174 h 2.507799 c 0.240408,0 0.435253,0.179658 0.435253,0.401174 v 1.483195 c 0,0.221516 -0.194845,0.401173 -0.435253,0.401173 z m 1.594176,-1.213485 c 0.397099,0 0.418954,0.08075 0.418954,0.538603 v 4.380313 c 0,0.27671 -0.129279,0.501189 -0.288563,0.501189 -0.159284,0 -0.288564,-0.224479 -0.288564,-0.501189 v -2.888599 c 0,-0.343017 -0.160025,-0.620838 -0.357463,-0.620838 m -2.348257,0.983042 v 2.518912" />
			<path fill="black" d="m 12.239799,6.3678835 c 0.399692,0 0.691589,-0.462294 0.452293,-0.931997 -0.137429,-0.269302 -0.448959,-0.757526 -0.448959,-0.757526 0,0 -0.311901,0.488224 -0.448959,0.757526 -0.239297,0.469703 0.04593,0.931997 0.445625,0.931997" />
			<path fill="black" d="m 14.714704,4.5013695 -0.826055,1.258345 h 0.600835 l -0.263004,0.901992 0.842353,-1.230192 -0.591944,-0.03149 z" />
			<path fill="none" stroke="white" stroke-width="0.185214" stroke-linecap="round" d="m 11.993316,5.7990535 c 0,0.03149 0.02,0.162248 0.197809,0.227813" />
		</g>
		<g stroke="none">
			<path d="M 0,16 h 7.75 l 3.25,3.25 l -3.25,3.25 h -7.75 z" fill="#039542" />
			<path d="M 0,24 h 9.75 l 3.25,3.25 l -3.25,3.25 h -9.75 z" fill="#a8cf15" />
			<path d="M 0,32 h 11.75 l 3.25,3.25 l -3.25,3.25 h -11.75 z" fill="#ffff00" />
			<path d="M 0,40 h 13.75 l 3.25,3.25 l -3.25,3.25 h -13.75 z" fill="#f6ba00" />
			<path d="M 0,48 h 15.75 l 3.25,3.25 l -3.25,3.25 h -15.75 z" fill="#cc0000" />
			<g fill="white" font-size="6.3" font-weight="bold" transform="translate(-0.5,2.2)">
				<text x="4.5" y="19.25" class="calibri" text-anchor="middle">A</text>
				<text x="4.5" y="27.25" class="calibri" text-anchor="middle">B</text>
				<text x="4.5" y="35.25" class="calibri" text-anchor="middle">C</text>
				<text x="4.5" y="43.25" class="calibri" text-anchor="middle">D</text>
				<text x="4.5" y="51.25" class="calibri" text-anchor="middle">E</text>
			</g>
		</g>
		<g display="[FUEL-EFFICIENCY-DISPLAY]" transform="translate(31.5,[FUEL-EFFICIENCY-Y])" fill="black">
			<path d="M 0,-4.75 v 9.5 h -6.5 l -4,-4.75 l 4,-4.75 z"/>
			<text x="-7" y="3" font-size="8.5" fill="white" font-weight="bold">[FUEL-EFFICIENCY]</text>
		</g>
	</g>
	<line x1="37.5" y1="30" x2="37.5" y2="84.5" stroke="black" stroke-width="0.1764" />
	<g id="wet-grip" transform="translate(39.5,30)">
		<g transform="translate(5.795,0)">
			<use xlink:href="#tire" x="2.976" y="14" />
			<path fill="none" stroke="black" stroke-width="0.296343" stroke-linecap="round" d="M 1.906431,11.428937 C 1.532669,11.303733 0.724395,11.181491 0.387676,10.961828 0.138007,10.798839 0.070589,10.485086 0.237652,10.26283 0.404345,10.040573 0.743657,9.992417 0.993326,10.155405 c 0.393765,0.257077 0.588981,0.890139 0.913105,1.273532 z m 11.093399,0 c 0.373762,-0.125204 1.182037,-0.247446 1.518756,-0.467109 0.249668,-0.162989 0.317086,-0.476742 0.150023,-0.698998 -0.166692,-0.222257 -0.506005,-0.270413 -0.755673,-0.107425 -0.393766,0.257077 -0.588981,0.890139 -0.913106,1.273532 z m -1.902556,2.397708 c 1.257233,0.04816 1.979568,0.04816 2.52595,-0.227443 0.40673,-0.205217 0.647138,-0.58009 0.49378,-0.91718 -0.153357,-0.33709 -0.624171,-0.473778 -1.049793,-0.305233 -0.670845,0.265597 -0.740115,0.702703 -1.969937,1.449856 z m -7.288249,0 c -1.257234,0.04816 -1.979198,0.04816 -2.52595,-0.227443 -0.406731,-0.205217 -0.647138,-0.58009 -0.493781,-0.91718 0.153357,-0.33709 0.624172,-0.473778 1.049794,-0.305233 0.670845,0.265597 0.740115,0.702703 1.969937,1.449856 z M 16.91922,6.576733 16.482115,7.1972 M 17.717306,5.520532 17.280201,6.140999 M 16.253374,5.520532 15.816269,6.140999 M 14.845488,5.520532 14.408383,6.140999 M 18.515394,4.464331 18.078289,5.084798 M 17.051463,4.464331 16.614358,5.084798 M 15.643576,4.464331 15.206471,5.084798 M 20.850056,2.92009 c 0,-0.80494 -0.671216,-1.457264 -1.499494,-1.457264 -0.0752,0 -0.14706,0.01111 -0.219293,0.02148 -0.06482,-0.747154 -0.701591,-1.336135 -1.486899,-1.336135 -0.584906,0 -1.086096,0.328941 -1.333542,0.80383 C 16.14784,0.806052 15.93188,0.714556 15.692584,0.714556 c -0.474889,0 -0.860505,0.351907 -0.907549,0.801236 -0.122242,-0.03112 -0.248187,-0.05297 -0.38043,-0.05297 -0.827907,0 -1.499123,0.652324 -1.499123,1.457265 0,0.80494 0.671216,1.457264 1.499123,1.457264 h 4.945957 c 0.828278,0 1.499494,-0.652324 1.499494,-1.457264 z" />
		</g>
		<g stroke="none">
			<path d="M 0,16 h 7.75 l 3.25,3.25 l -3.25,3.25 h -7.75 z" fill="#0059ae" />
			<path d="M 0,24 h 9.75 l 3.25,3.25 l -3.25,3.25 h -9.75 z" fill="#3366cc" />
			<path d="M 0,32 h 11.75 l 3.25,3.25 l -3.25,3.25 h -11.75 z" fill="#6699cc" />
			<path d="M 0,40 h 13.75 l 3.25,3.25 l -3.25,3.25 h -13.75 z" fill="#99ccff" />
			<path d="M 0,48 h 15.75 l 3.25,3.25 l -3.25,3.25 h -15.75 z" fill="#ccddff" />
			<g fill="white" font-size="6.3" font-weight="bold" transform="translate(-0.5,2.2)">
				<text x="4.5" y="19.25" class="calibri" text-anchor="middle">A</text>
				<text x="4.5" y="27.25" class="calibri" text-anchor="middle">B</text>
				<text x="4.5" y="35.25" class="calibri" text-anchor="middle">C</text>
				<text x="4.5" y="43.25" class="calibri" text-anchor="middle">D</text>
				<text x="4.5" y="51.25" class="calibri" text-anchor="middle">E</text>
			</g>
		</g>
		<g display="[WET-GRIP-DISPLAY]" transform="translate(32.5,[WET-GRIP-Y])" fill="black">
			<path d="M 0,-4.75 v 9.5 h -6.5 l -4,-4.75 l 4,-4.75 z"/>
			<text x="-7" y="3" font-size="8.5" fill="white" font-weight="bold">[WET-GRIP]</text>
		</g>
	</g>
	<line x1="3" y1="87" x2="72" y2="87" stroke="black" stroke-width="0.1764" />
	<g id="footer" transform="translate(0,108)">
		<g id="rolling-noise" display="[ROLLING-NOISE-DISPLAY]" transform="translate([ROLLING-NOISE-X],0)">
			<g fill="none" stroke="black" stroke-width="0.3">
				<use xlink:href="#tire" x="0" y="0" />
				<path fill="white" d="m 5.7,-7.8 v -7.14 l 6.14,0 5.52,-3.52 v 14.18 l -5.52,-3.52 Z" />
				<path d="m 19.817896,-14.796481 c 1.062338,2.745624 1.062817,4.471903 0,7.1366748" />
				<path d="m 21.903739,-15.711619 c 1.297069,2.99465 1.351876,5.9807833 0,9.0867028" />
				<path d="m 23.888653,-16.88911 c 1.733912,3.727981 1.733912,7.6239433 0,11.1685138" />
				<text x="16.5" y="-10" stroke="none" fill="black" text-anchor="end" font-size="3.175"><tspan font-size="4.233" font-weight="bold">[ROLLING-NOISE-DB]</tspan> dB</text>
				<text x="8.8" y="0" stroke="none" fill="black" font-size="3.527"><tspan class="[ROLLING-NOISE-A]">A</tspan><tspan class="[ROLLING-NOISE-B]">B</tspan><tspan class="[ROLLING-NOISE-C]">C</tspan></text>
			</g>
		</g>
		<g id="snow-grip" display="[SNOW-GRIP-DISPLAY]" transform="translate([SNOW-GRIP-X],0)">
			<path d="m 0,0 2.9,-7.2 1,1.8 L 7,-14 9,-9 9.6,-11.2 15,0 Z" fill="none" stroke="black" stroke-width="0.3" />
			<use xlink:href="#snowflake" x="8" y="-4" />
		</g>
		<g id="ice-grip" display="[ICE-GRIP-DISPLAY]" transform="translate([ICE-GRIP-X],0)">
			<path d="M 0,0 7,-13 15,0 Z" fill="none" stroke="black" stroke-width="0.3" />
			<path d="M 9.1015625,-7.22656 8.53125,-4.6543 7.8886719,-5.57031 7.0234375,-2.94922 5.8359375,-6.13867 5.2675781,-5.27344 4.625,-6.13867 1.8789062,-1.09375 H 13.082031 Z" fill="none" stroke="black" stroke-width="0.3" />
			<path d="m 7.8532415,-5.4623478 2.8869925,4.36923 m -6.4139962,-4.49606 2.9725902,4.49606 m -2.7110149,-4.9766 3.2891396,4.9766 m -2.4157566,-4.47444 2.9567721,4.47444 m -1.1463249,-2.60737 1.7244501,2.60737 m -1.5244539,-3.21322 2.1240634,3.21322 m -1.9372306,-3.77921 2.4977777,3.77921 m -1.5162753,-4.05092 2.6764303,4.05092 m -2.5313875,-4.70511 3.1095125,4.7051 m -2.9648823,-5.35742 3.5410543,5.35742 m -9.4372873,-2.12097 1.4021321,2.12098 m -0.630373,-3.5388 2.339357,3.5388 m -2.070255,-4.03317 2.6659583,4.03317 m -3.967128,-1.64276 1.0862689,1.64276 m -0.5589449,-2.61152 1.7249605,2.61152 m -1.4721785,-3.07591 2.0327254,3.07591 m -3.0764933,-1.15838 0.7659465,1.15838 m -1.0158217,-0.69932 0.4630872,0.69932" stroke="black" stroke-width="0.1" />
		</g>
		<g transform="translate(72,0)">
			<text fill="black" text-anchor="end" font-size="2" transform="rotate(90)">2020/740</text>
		</g>
	</g>
</svg>''';

  /// Create EC/1222/2009 label
  static String createLabelEC1222(EuTireLabel data) {
    String label = _ec1222Template;

    // Replace placeholders
    label = label.replaceAll('[TITLE]', data.title);
    label =
        label.replaceAll('[TIRE-CLASS]', _getTireClassString(data.tireClass));

    // Fuel efficiency
    final fuelDisplay =
        data.fuelEfficiency == FuelEfficiencyClass.none ? 'none' : '';
    final fuelY = _getFuelEfficiencyY(data.fuelEfficiency);
    label = label.replaceAll('[FUEL-EFFICIENCY-DISPLAY]', fuelDisplay);
    label = label.replaceAll('[FUEL-EFFICIENCY-Y]', fuelY);
    label = label.replaceAll('[FUEL-EFFICIENCY]', data.fuelEfficiency.letter);

    // Wet grip
    final wetDisplay = data.wetGrip == WetGripClass.none ? 'none' : '';
    final wetY = _getWetGripY(data.wetGrip);
    label = label.replaceAll('[WET-GRIP-DISPLAY]', wetDisplay);
    label = label.replaceAll('[WET-GRIP-Y]', wetY);
    label = label.replaceAll('[WET-GRIP]', data.wetGrip.letter);

    // Rolling noise
    _setRollingNoiseDisplay(label, data.rollingNoise);

    // Rolling noise dB
    final noiseDb =
        data.rollingNoiseDb > 0 ? data.rollingNoiseDb.toString() : '';
    final noiseDbDisplay = data.rollingNoiseDb > 0 ? '' : 'none';
    label = label.replaceAll('[ROLLING-NOISE-DB-DISPLAY]', noiseDbDisplay);
    label = label.replaceAll('[ROLLING-NOISE-DB]', noiseDb);

    return label;
  }

  /// Create EU/2020/740 label
  static String createLabelEU2020(EuTireLabel data) {
    String label = _eu2020Template;

    // Footer positioning array like in C code
    final List<List<String>> footerPositions = [
      ['0', '0', '0'], // empty
      ['22.5', '0', '0'], // rolling noise
      ['0', '30', '0'], // snow grip
      ['14', '41', '0'], // rolling noise + snow grip
      ['0', '0', '30'], // ice grip
      ['14', '0', '41'], // rolling noise + ice grip
      ['0', '20', '40'], // snow grip + ice grip
      ['4', '31', '51'], // rolling noise + snow grip + ice grip
    ];

    // Calculate positioning index
    int x = 0;
    if (data.rollingNoise != RollingNoiseClass.none ||
        data.rollingNoiseDb > 0) {
      x |= 1 << 0;
    }
    if (data.snowGrip) {
      x |= 1 << 1;
    }
    if (data.iceGrip) {
      x |= 1 << 2;
    }

    // Basic replacements
    label = label.replaceAll('[TITLE]', data.title);
    label = label.replaceAll('[TRADEMARK]', data.trademark);
    label = label.replaceAll('[TIRE-TYPE]', data.tireType);
    label = label.replaceAll('[TIRE-SIZE-DESIGNATION]', data.tireSize);
    label =
        label.replaceAll('[TIRE-CLASS]', _getTireClassString(data.tireClass));

    // QR code
    final qrCodeUrl = urlEncode(data.qrcode);
    final qrCode = _generateQRCode(data.qrcode);
    label = label.replaceAll('[QR-CODE-HREF]', qrCodeUrl);
    label = label.replaceAll('[QR-CODE]', qrCode);

    // Fuel efficiency
    final fuelDisplay =
        data.fuelEfficiency == FuelEfficiencyClass.none ? 'none' : '';
    final fuelY = _getEU2020FuelEfficiencyY(data.fuelEfficiency);
    label = label.replaceAll('[FUEL-EFFICIENCY-DISPLAY]', fuelDisplay);
    label = label.replaceAll('[FUEL-EFFICIENCY-Y]', fuelY);
    label = label.replaceAll('[FUEL-EFFICIENCY]', data.fuelEfficiency.letter);

    // Wet grip
    final wetDisplay = data.wetGrip == WetGripClass.none ? 'none' : '';
    final wetY = _getEU2020WetGripY(data.wetGrip);
    label = label.replaceAll('[WET-GRIP-DISPLAY]', wetDisplay);
    label = label.replaceAll('[WET-GRIP-Y]', wetY);
    label = label.replaceAll('[WET-GRIP]', data.wetGrip.letter);

    // Rolling noise
    final rollingNoiseDisplay = data.rollingNoiseDb > 0 ? '' : 'none';
    label = label.replaceAll('[ROLLING-NOISE-DISPLAY]', rollingNoiseDisplay);
    label = label.replaceAll('[ROLLING-NOISE-X]', footerPositions[x][0]);
    label = label.replaceAll('[ROLLING-NOISE-DB]',
        data.rollingNoiseDb > 0 ? data.rollingNoiseDb.toString() : '');

    // Rolling noise classes (A, B, C indicators)
    switch (data.rollingNoise) {
      case RollingNoiseClass.rnc1:
        label = label.replaceAll('[ROLLING-NOISE-A]', 'active');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
      case RollingNoiseClass.rnc2:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', 'active');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
      case RollingNoiseClass.rnc3:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', 'active');
        break;
      case RollingNoiseClass.none:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
    }

    // Snow grip
    final snowDisplay = data.snowGrip ? '' : 'none';
    label = label.replaceAll('[SNOW-GRIP-DISPLAY]', snowDisplay);
    label = label.replaceAll('[SNOW-GRIP-X]', footerPositions[x][1]);

    // Ice grip
    final iceDisplay = data.iceGrip ? '' : 'none';
    label = label.replaceAll('[ICE-GRIP-DISPLAY]', iceDisplay);
    label = label.replaceAll('[ICE-GRIP-X]', footerPositions[x][2]);

    return label;
  }

  static String _getTireClassString(TireClass tireClass) {
    switch (tireClass) {
      case TireClass.c1:
        return 'C1';
      case TireClass.c2:
        return 'C2';
      case TireClass.c3:
        return 'C3';
      case TireClass.error:
        return '';
    }
  }

  static String _getFuelEfficiencyY(FuelEfficiencyClass efficiency) {
    switch (efficiency) {
      case FuelEfficiencyClass.a:
        return '24.375';
      case FuelEfficiencyClass.b:
        return '29.875';
      case FuelEfficiencyClass.c:
        return '35.375';
      case FuelEfficiencyClass.d:
        return '40.875';
      case FuelEfficiencyClass.e:
        return '46.375';
      case FuelEfficiencyClass.f:
        return '51.875';
      case FuelEfficiencyClass.g:
        return '58.375';
      case FuelEfficiencyClass.none:
        return '0';
    }
  }

  static String _getEU2020FuelEfficiencyY(FuelEfficiencyClass efficiency) {
    switch (efficiency) {
      case FuelEfficiencyClass.a:
        return '19.25';
      case FuelEfficiencyClass.b:
        return '27.25';
      case FuelEfficiencyClass.c:
        return '35.25';
      case FuelEfficiencyClass.d:
        return '43.25';
      case FuelEfficiencyClass.e:
        return '51.25';
      case FuelEfficiencyClass.f:
        return '51.25'; // Same as E in EU/2020/740
      case FuelEfficiencyClass.g:
        return '51.25'; // Same as E in EU/2020/740
      case FuelEfficiencyClass.none:
        return '0';
    }
  }

  static String _getWetGripY(WetGripClass wetGrip) {
    switch (wetGrip) {
      case WetGripClass.a:
        return '24.375';
      case WetGripClass.b:
        return '29.875';
      case WetGripClass.c:
        return '35.375';
      case WetGripClass.d:
        return '40.875';
      case WetGripClass.e:
        return '46.375';
      case WetGripClass.f:
        return '51.875';
      case WetGripClass.g:
        return '58.375';
      case WetGripClass.none:
        return '0';
    }
  }

  static String _getEU2020WetGripY(WetGripClass wetGrip) {
    switch (wetGrip) {
      case WetGripClass.a:
        return '19.25';
      case WetGripClass.b:
        return '27.25';
      case WetGripClass.c:
        return '35.25';
      case WetGripClass.d:
        return '43.25';
      case WetGripClass.e:
        return '51.25';
      case WetGripClass.f:
        return '51.25'; // Same as E in EU/2020/740
      case WetGripClass.g:
        return '51.25'; // Same as E in EU/2020/740
      case WetGripClass.none:
        return '0';
    }
  }

  static void _setRollingNoiseDisplay(String label, RollingNoiseClass noise) {
    switch (noise) {
      case RollingNoiseClass.rnc3:
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.rnc2:
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.rnc1:
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.none:
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', '');
    }
  }

  static String _generateQRCode(String data) {
    if (data.isEmpty) {
      return '';
    }

    // Generate actual QR code pattern based on the C implementation
    // This is a placeholder - the C code uses the QRcode library
    return '''<path d="M0,0h1v7h-1zM0,8h1v2h-1zM0,11h1v4h-1zM0,18h1v1h-1zM0,20h1v1h-1zM0,22h1v7h-1zM1,0h1v1h-1zM1,6h1v1h-1zM1,8h1v5h-1zM1,17h1v1h-1zM1,19h1v1h-1zM1,22h1v1h-1zM1,28h1v1h-1zM2,0h1v1h-1zM2,2h1v3h-1zM2,6h1v1h-1zM2,8h1v2h-1zM2,11h1v1h-1zM2,13h1v1h-1zM2,16h1v2h-1zM2,19h1v1h-1zM2,22h1v1h-1zM2,24h1v3h-1zM2,28h1v1h-1zM3,0h1v1h-1zM3,2h1v3h-1zM3,6h1v1h-1zM3,10h1v2h-1zM3,14h1v2h-1zM3,19h1v2h-1zM3,22h1v1h-1zM3,24h1v3h-1zM3,28h1v1h-1zM4,0h1v1h-1zM4,2h1v3h-1zM4,6h1v1h-1zM4,8h1v1h-1zM4,10h1v3h-1zM4,18h1v2h-1zM4,22h1v1h-1zM4,24h1v3h-1zM4,28h1v1h-1zM5,0h1v1h-1zM5,6h1v1h-1zM5,8h1v1h-1zM5,12h1v5h-1zM5,20h1v1h-1zM5,22h1v1h-1zM5,28h1v1h-1zM6,0h1v7h-1zM6,8h1v1h-1zM6,10h1v1h-1zM6,12h1v1h-1zM6,14h1v1h-1zM6,16h1v1h-1zM6,18h1v1h-1zM6,20h1v1h-1zM6,22h1v7h-1zM7,8h1v1h-1zM7,12h1v1h-1zM7,15h1v1h-1zM7,18h1v1h-1zM8,2h1v1h-1zM8,6h1v3h-1zM8,11h1v2h-1zM8,15h1v1h-1zM8,17h1v2h-1zM8,21h1v4h-1zM8,26h1v3h-1zM9,0h1v1h-1zM9,2h1v2h-1zM9,5h1v1h-1zM9,7h1v1h-1zM9,10h1v1h-1zM9,13h1v3h-1zM9,17h1v1h-1zM9,20h1v4h-1zM9,25h1v3h-1zM10,1h1v4h-1zM10,6h1v4h-1zM10,15h1v1h-1zM10,18h1v2h-1zM10,22h1v1h-1zM10,24h1v2h-1zM10,27h1v1h-1zM11,1h1v1h-1zM11,3h1v1h-1zM11,8h1v2h-1zM11,11h1v1h-1zM11,13h1v2h-1zM11,16h1v2h-1zM11,19h1v1h-1zM11,21h1v2h-1zM11,24h1v2h-1zM11,27h1v1h-1zM12,0h1v3h-1zM12,6h1v2h-1zM12,12h1v4h-1zM12,20h1v4h-1zM12,28h1v1h-1zM13,0h1v1h-1zM13,2h1v2h-1zM13,5h1v1h-1zM13,7h1v1h-1zM13,10h1v1h-1zM13,13h1v1h-1zM13,15h1v1h-1zM13,18h1v1h-1zM13,21h1v1h-1zM13,23h1v1h-1zM13,26h1v1h-1zM14,1h1v4h-1zM14,6h1v4h-1zM14,14h1v4h-1zM14,22h1v4h-1zM15,1h1v1h-1zM15,3h1v1h-1zM15,8h1v2h-1zM15,11h1v1h-1zM15,13h1v2h-1zM15,16h1v2h-1zM15,19h1v1h-1zM15,21h1v2h-1zM15,24h1v2h-1zM15,27h1v1h-1zM16,0h1v3h-1zM16,6h1v2h-1zM16,12h1v4h-1zM16,20h1v4h-1zM16,28h1v1h-1zM17,0h1v1h-1zM17,2h1v2h-1zM17,5h1v1h-1zM17,7h1v1h-1zM17,10h1v1h-1zM17,13h1v1h-1zM17,15h1v1h-1zM17,18h1v1h-1zM17,21h1v1h-1zM17,23h1v1h-1zM17,26h1v1h-1zM18,0h1v5h-1zM18,6h1v4h-1zM18,14h1v4h-1zM18,22h1v4h-1zM19,1h1v1h-1zM19,3h1v3h-1zM19,7h1v1h-1zM19,11h1v1h-1zM19,15h1v1h-1zM19,22h1v2h-1zM19,25h1v2h-1zM20,0h1v1h-1zM20,2h1v6h-1zM20,14h1v2h-1zM20,18h1v1h-1zM20,20h1v9h-1zM21,8h1v7h-1zM21,16h1v1h-1zM21,18h1v1h-1zM21,20h1v1h-1zM21,24h1v2h-1zM21,28h1v1h-1zM22,0h1v7h-1zM22,8h1v2h-1zM22,11h1v4h-1zM22,16h1v3h-1zM22,20h1v1h-1zM22,22h1v1h-1zM22,24h1v1h-1zM22,27h1v1h-1zM23,0h1v1h-1zM23,6h1v1h-1zM23,9h1v1h-1zM23,14h1v1h-1zM23,19h1v2h-1zM23,24h1v1h-1zM23,26h1v2h-1zM24,0h1v1h-1zM24,2h1v3h-1zM24,6h1v1h-1zM24,10h1v2h-1zM24,14h1v1h-1zM24,20h1v7h-1zM24,28h1v1h-1zM25,0h1v1h-1zM25,2h1v3h-1zM25,6h1v1h-1zM25,9h1v1h-1zM25,11h1v3h-1zM25,15h1v1h-1zM25,18h1v2h-1zM25,22h1v1h-1zM25,26h1v1h-1zM25,28h1v1h-1zM26,0h1v1h-1zM26,2h1v3h-1zM26,6h1v1h-1zM26,8h1v1h-1zM26,10h1v1h-1zM26,13h1v1h-1zM26,17h1v1h-1zM26,21h1v1h-1zM26,26h1v1h-1zM27,0h1v1h-1zM27,6h1v1h-1zM27,10h1v3h-1zM27,14h1v3h-1zM27,18h1v2h-1zM27,21h1v4h-1zM27,27h1v2h-1zM28,0h1v7h-1zM28,9h1v2h-1zM28,12h1v3h-1zM28,16h1v3h-1zM28,21h1v4h-1zM28,26h1v1h-1zM28,28h1v1h-1z"/>''';
  }

  /// URL encode helper function
  static String urlEncode(String str) {
    return Uri.encodeComponent(str);
  }
}
