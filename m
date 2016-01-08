From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Overriding with node41 doesn't work.
Date: Fri, 8 Jan 2016 10:46:22 +0100
Message-ID: <568F856E.3000801@gmail.com>
References: <n6gg6h$7u6$1@ger.gmane.org> <568C3977.5010606@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000505070506090000030404"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type;
        bh=Twm/s2S62EYuDfNV4LYPs6MfHtr7ocpG5jsTesCZCMQ=;
        b=pieUo3TYy7rhB+FCkfvTMeHLfzKJsg79sFzGYrxzBlaiKlsB8AosgAXYS2jovLWqHS
         9C53f0dmwjsPIQiMyH5D9dpjIXo2uytzDDI9mAwJnfKcPRmVwpl+8w4YnvYbCi1c9U26
         ypgFy3JHiTEPAOYQ4ZbL6DrrhhOH6gcEnz9l5O4cop2//Nlmi7TKppp6+eIBn7P0wLdS
         XTqD0+vO5j7SvXBhGA12X090GWRIEOBy0Z5l3FCcNShiXeh96E5QbP++paSiZdkPIEQ6
         bHPebqRMHT/rG5MgbZBYKISQXlg/82Ra/h3Ycd+AGrF7Ms4HuKzGYJ0CjMho8jRjOVti
         CojA==
In-Reply-To: <568C3977.5010606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000505070506090000030404
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

The attached patch against reiser4progs-1.1.0 allows to print
node plugin without any tricky manipulations:

# debugfs.reiser4 -f /dev/xxx

[...]
Format super block (17):
format:        format40
version:    1
magic:        ReIsEr40FoRmAt
mkfs id:    0x10eca54c
flushes:    0
blocks:        128000
free blocks:    127970
root block:    23
node plugin:    0x1 (node41)
tail policy:    0x2 (smart)
next oid:    0x10000
file count:    1
tree height:    2
key policy:    LARGE
[...]

Thanks,
Edward.

On 01/05/2016 10:45 PM, Edward Shishkin wrote:
>
>
> On 01/05/2016 02:18 PM, Georgios Tsalikis wrote:
>> Or at least so it seems. Once i used node=node41 for checksums but 
>> the system showed node40.
>
>
> Who exactly reports "node40"?
>
>
>> Now i did an fsck with override node=node41 trying to add the feature 
>> in a partition with node40. It reports node40 afterwards. Any clues?
>
>
> You can specify node=node41 only when formatting a partition.
> Different node formats in the same reiser4 volume are not supported.
> Conversion of node formats are not implemented. To check the actual
> node format, dump the tree with "debugfs.reiser4 -f -t /dev/xxx" and
> grep for "NODE". If your nodes are managed by node41 plugin, then
> you'll see the field "CSUM=xxxxx".
>
> Thanks,
> Edward.


--------------000505070506090000030404
Content-Type: text/x-patch;
 name="reiser4progs-format40-print-node-plugin-id.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-format40-print-node-plugin-id.patch"

Print node layout plugin id of the format40 super-block.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 plugin/format/format40/format40_repair.c |   31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

--- a/plugin/format/format40/format40_repair.c
+++ b/plugin/format/format40/format40_repair.c
@@ -374,31 +374,33 @@ void format40_print(reiser4_format_ent_t
 		    uint16_t options) 
 {
 	format40_super_t *super;
-	reiser4_plug_t *plug;
+	reiser4_plug_t *tplug;
+	reiser4_plug_t *nplug;
 	format40_t *format;
-	rid_t pid;
-    
+	rid_t tpid;
+	rid_t npid;
+
 	aal_assert("vpf-246", entity != NULL);
 	aal_assert("umka-1290", stream != NULL);
 
 	format = (format40_t *)entity;
 	super = &format->super;
     
-	pid = get_sb_policy(super);
+	tpid = get_sb_policy(super);
+	npid = get_sb_node_pid(super);
+
+	if (!(tplug = format40_core->factory_ops.ifind(POLICY_PLUG_TYPE, tpid)))
+		aal_error("Can't find tail policy plugin by its id 0x%x.", tpid);
+
+	if (!(nplug = format40_core->factory_ops.ifind(NODE_PLUG_TYPE, npid)))
+		aal_error("Can't find node plugin by its id 0x%x.", npid);
 
-	if (!(plug = format40_core->factory_ops.ifind(POLICY_PLUG_TYPE, pid))) {
-		aal_error("Can't find tail policy plugin by its id 0x%x.", pid);
-	}
-		
 	aal_stream_format(stream, "Format super block (%lu):\n",
 			  FORMAT40_BLOCKNR(format->blksize));
 	
-	aal_stream_format(stream, "plugin:\t\t%s\n", 
+	aal_stream_format(stream, "format:\t\t%s\n",
 			  entity->plug->p.label);
 	
-	aal_stream_format(stream, "description:\t%s\n", 
-			  entity->plug->p.desc);
-
 	aal_stream_format(stream, "version:\t%u\n", 
 			  get_sb_version(super));
 	
@@ -420,8 +422,11 @@ void format40_print(reiser4_format_ent_t
 	aal_stream_format(stream, "root block:\t%llu\n", 
 			  get_sb_root_block(super));
 
+	aal_stream_format(stream, "node plugin:\t0x%x (%s)\n",
+			  npid, nplug ? nplug->label: "absent");
+
 	aal_stream_format(stream, "tail policy:\t0x%x (%s)\n",
-			  pid, plug ? plug->label: "absent");
+			  tpid, tplug ? tplug->label: "absent");
 	
 	aal_stream_format(stream, "next oid:\t0x%llx\n",
 			  get_sb_oid(super));

--------------000505070506090000030404--
