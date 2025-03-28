<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntityEffectAdded(MobEffectEvent.Added event) {
			<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
				"x": "event.getEntity().getX()",
				"y": "event.getEntity().getY()",
				"z": "event.getEntity().getZ()",
				"world": "event.getEntity().level()",
				"entity": "event.getEntity()",
				"newEffect": "event.getEffectInstance().getEffect()",
				"oldEffect": "event.getOldEffectInstance().getEffect()",
				"sourceentity": "event.getSource().getEntity()",
				"event": "event"
			}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}