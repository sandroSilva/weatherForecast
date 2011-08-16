package
	{
		import flash.display.MovieClip;
		import flash.display.Loader;
		import flash.net.URLLoader;
		import flash.net.URLRequest;
		import flash.events.Event;
			
		public class Impe extends MovieClip
				{
					//Não vou comentar nada no Código, está MUITO simples!
					public var urlApiImgs:String = "http://img0.cptec.inpe.br/~rgrafico/icones_principais/tempo/png/medio_snome/"
					public var urlXml:URLRequest=new URLRequest("Impe.php");
					
					public var carregadorXml:URLLoader=new URLLoader(urlXml);
					public var tempoXml:XML = new XML();
					public var previsaoAtual:PrevisaoTempo;
					public var previsaoAmanha:PrevisaoTempo;
					public var previsaoDepoisAmanha:PrevisaoTempo;
			
					public function Impe():void
						{
							carregadorXml.addEventListener(Event.COMPLETE, montaTempo);
						}
			
					public function montaTempo(evt:Event):void
						{
							tempoXml=XML(carregadorXml.data);
							
							previsaoAtual = new PrevisaoTempo();
							previsaoAtual.txtLabel.text = tempoXml.previsao[0].dia.substr(8,2)+"/"+tempoXml.previsao[0].dia.substr(5,2)+"/"+tempoXml.previsao[0].dia.substr(0,4);
							previsaoAtual.txtTemperaturaMin.text = "min " + tempoXml.previsao[0].minima + "ºc";
							previsaoAtual.txtTemperaturaMax.text = "max " + tempoXml.previsao[0].maxima + "ºc";
							var urlPrevisaoAtual:URLRequest=new URLRequest(urlApiImgs+tempoXml.previsao[0].tempo+".png");
							var imgPrevisaoAtual:Loader = new Loader();
							imgPrevisaoAtual.load(urlPrevisaoAtual);
							previsaoAtual.addChild(imgPrevisaoAtual);
							addChild(previsaoAtual);
							previsaoAtual.x = 50;
							previsaoAtual.y = 50;
							
							previsaoAmanha = new PrevisaoTempo();
							previsaoAmanha.txtLabel.text = tempoXml.previsao[1].dia.substr(8,2)+"/"+tempoXml.previsao[1].dia.substr(5,2)+"/"+tempoXml.previsao[1].dia.substr(0,4);
							previsaoAmanha.txtTemperaturaMin.text = "min " + tempoXml.previsao[1].minima + "ºc";
							previsaoAmanha.txtTemperaturaMax.text = "max " + tempoXml.previsao[1].maxima + "ºc";
							var urlPrevisaoAmanha:URLRequest=new URLRequest(urlApiImgs+tempoXml.previsao[1].tempo+".png");
							var imgPrevisaoAmanha:Loader = new Loader();
							imgPrevisaoAmanha.load(urlPrevisaoAmanha);
							previsaoAmanha.addChild(imgPrevisaoAmanha);
							addChild(previsaoAmanha);
							previsaoAmanha.x = previsaoAtual.x;
							previsaoAmanha.y = previsaoAtual.y + previsaoAtual.height + 25;
							
							previsaoDepoisAmanha = new PrevisaoTempo();
							previsaoDepoisAmanha.txtLabel.text = tempoXml.previsao[2].dia.substr(8,2)+"/"+tempoXml.previsao[2].dia.substr(5,2)+"/"+tempoXml.previsao[2].dia.substr(0,4);
							previsaoDepoisAmanha.txtTemperaturaMin.text = "min " + tempoXml.previsao[2].minima + "ºc";
							previsaoDepoisAmanha.txtTemperaturaMax.text = "max " + tempoXml.previsao[2].maxima + "ºc";
							var urlDepoisAmanha:URLRequest=new URLRequest(urlApiImgs+tempoXml.previsao[2].tempo+".png");
							var imgDepoisAmanha:Loader = new Loader();
							imgDepoisAmanha.load(urlDepoisAmanha);
							previsaoDepoisAmanha.addChild(imgDepoisAmanha);
							addChild(previsaoDepoisAmanha);
							previsaoDepoisAmanha.x = previsaoAmanha.x;
							previsaoDepoisAmanha.y = previsaoAmanha.y + previsaoAmanha.height + 25;
						}
			}	
	}