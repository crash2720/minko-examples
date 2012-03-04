package aerys.minko.example.core.light
{
	import aerys.minko.render.effect.Effect;
	import aerys.minko.render.effect.basic.BasicShader;
	import aerys.minko.scene.node.mesh.Mesh;
	import aerys.minko.scene.node.mesh.geometry.primitive.TeapotGeometry;
	import aerys.minko.type.math.Matrix4x4;
	import aerys.minko.type.math.Vector4;
	
	import flash.events.Event;
	import flash.utils.setTimeout;

	public class DirectionalLightExample extends MinkoExampleApplication
	{
		protected var _matrix	: Matrix4x4	= new Matrix4x4();
		
		override protected function initializeScene() : void
		{
			camera.position.set(0, 0, -10);
			cameraController.setPivot(0, 1.3, 0);
			
			scene.bindings.setProperties({
				lightEnabled		: true,
				lightDiffuseColor	: 0xffffff,
				lightDiffuse		: 0.8,
				lightAmbientColor	: 0xffffff,
				lightAmbient		: 0.2
			});
			
			scene.addChild(
				new Mesh(
					new TeapotGeometry(),
					{
						diffuseColor	: 0xffffffff,
						lightEnabled	: true
					}
				)
			);
		}
		
		override protected function enterFrameHandler(event:Event):void
		{
			_matrix.appendRotation(.05, Vector4.Y_AXIS);
			scene.bindings.setProperty(
				"lightDirection",
				_matrix.transformVector(Vector4.ONE)
			);
			
			super.enterFrameHandler(event);
		}
	}
}