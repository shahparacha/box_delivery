/*!CK:2780570347!*//*1417546214,*/

if (self.CavalryLogger) { CavalryLogger.start_js(["HUkBe"]); }

__d("DevsiteVitals",["DOMQuery","Event","Parent","Vitals","csx"],function(a,b,c,d,e,f,g,h,i,j,k){var l={closeDialogMonitor:function(m,n,o){m.subscribe('hide',function(){j.log(n,o);});},addedItemsMonitor:function(m,n,o){h.listen(n,'mouseup',function(p){var q=g.scry(m,"._5rfx"),r='';for(var s=0;s<q.length;s++)if(q[s].firstChild.checked){var t=i.byAttribute(q[s],'data-vitals');if(t)r+=t.getAttribute('data-vitals')+' , ';}j.log(o,r);});},checkBoxMonitor:function(m,n){h.listen(m,'mouseup',function(o){var p=o.getTarget(),q=i.byAttribute(p,'data-vitals');if(q){var r=g.scry(q,"._5rfx");if(r){var s=r[0].firstChild.checked?0:1,event=q.getAttribute('data-vitals')+': '+s;j.log(n,event);}}});},linkButtonSearcher:function(event){return (i.byTag(event.getTarget(),'A')||i.byTag(event.getTarget(),'Button'));},logVitalsAttribute:function(m,n){var o=i.byAttribute(m,'data-vitals');if(!o)return;j.log(n,o.getAttribute('data-vitals'));},logevent:function(m){h.listen(document,'mouseup',function(n){var o=n.getTarget();switch(o.nodeName){case 'A':l.logVitalsAttribute(o,m);break;case 'BUTTON':l.logVitalsAttribute(o,m);break;default:var p=l.linkButtonSearcher(n);if(p)l.logVitalsAttribute(p,m);break;}});}};e.exports=l;},null);