package
	{
		import flash.display.MovieClip;
		import flash.display.Loader;
		import flash.net.URLLoader;
		import flash.net.URLRequest;
		import flash.events.Event;
			
		public class GoogleWeather extends MovieClip
				{
					//Não vou comentar nada no Código, está MUITO simples!
					public var urlApiGoogle:String = "http://www.google.com"
					public var urlXml:URLRequest=new URLRequest("GoogleWeather.php");
					public var carregadorXml:URLLoader=new URLLoader(urlXml);
					public var tempoXml:XML = new XML();
					public var previsaoAtual:PrevisaoTempo;
					public var previsaoAmanha:PrevisaoTempo;
					public var previsaoDepoisAmanha:PrevisaoTempo;
			
					public function GoogleWeather():void
						{
							carregadorXml.addEventListener(Event.COMPLETE, montaTempo);
						}
			
					public function montaTempo(evt:Event):void
						{
							tempoXml=XML(carregadorXml.data);
							
							previsaoAtual = new PrevisaoTempo();
							previsaoAtual.txtLabel.text = tempoXml.weather[0].forecast_conditions[0].day_of_week.@data + " - " + tempoXml.weather[0].forecast_conditions[0].condition.@data;
							previsaoAtual.txtTemperaturaMin.text = "min " + tempoXml.weather[0].forecast_conditions[0].low.@data + "ºc";
							previsaoAtual.txtTemperaturaMax.text = "max " + tempoXml.weather[0].forecast_conditions[0].high.@data + "ºc";
							var urlPrevisaoAtual:URLRequest=new URLRequest(urlApiGoogle+tempoXml.weather[0].forecast_conditions[0].icon.@data);
							var imgPrevisaoAtual:Loader = new Loader();
							imgPrevisaoAtual.load(urlPrevisaoAtual);
							previsaoAtual.addChild(imgPrevisaoAtual);
							addChild(previsaoAtual);
							previsaoAtual.x = 50;
							previsaoAtual.y = 50;
							
							previsaoAmanha = new PrevisaoTempo();
							previsaoAmanha.txtLabel.text = tempoXml.weather[0].forecast_conditions[1].day_of_week.@data + " - " + tempoXml.weather[0].forecast_conditions[1].condition.@data;
							previsaoAmanha.txtTemperaturaMin.text = "min " + tempoXml.weather[0].forecast_conditions[1].low.@data + "ºc";
							previsaoAmanha.txtTemperaturaMax.text = "max " + tempoXml.weather[0].forecast_conditions[1].high.@data + "ºc";
							var urlPrevisaoAmanha:URLRequest=new URLRequest(urlApiGoogle+tempoXml.weather[0].forecast_conditions[1].icon.@data);
							var imgPrevisaoAmanha:Loader = new Loader();
							imgPrevisaoAmanha.load(urlPrevisaoAmanha);
							previsaoAmanha.addChild(imgPrevisaoAmanha);
							addChild(previsaoAmanha);
							previsaoAmanha.x = previsaoAtual.x;
							previsaoAmanha.y = previsaoAtual.y + previsaoAtual.height + 25;
							
							previsaoDepoisAmanha = new PrevisaoTempo();
							previsaoDepoisAmanha.txtLabel.text = tempoXml.weather[0].forecast_conditions[2].day_of_week.@data + " - " + tempoXml.weather[0].forecast_conditions[2].condition.@data;
							previsaoDepoisAmanha.txtTemperaturaMin.text = "min " + tempoXml.weather[0].forecast_conditions[2].low.@data + "ºc";
							previsaoDepoisAmanha.txtTemperaturaMax.text = "max " + tempoXml.weather[0].forecast_conditions[2].high.@data + "ºc";
							var urlDepoisAmanha:URLRequest=new URLRequest(urlApiGoogle+tempoXml.weather[0].forecast_conditions[2].icon.@data);
							var imgDepoisAmanha:Loader = new Loader();
							imgDepoisAmanha.load(urlDepoisAmanha);
							previsaoDepoisAmanha.addChild(imgDepoisAmanha);
							addChild(previsaoDepoisAmanha);
							previsaoDepoisAmanha.x = previsaoAmanha.x;
							previsaoDepoisAmanha.y = previsaoAmanha.y + previsaoAmanha.height + 25;
						}
			}	
	}