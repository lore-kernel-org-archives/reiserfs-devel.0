From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 2 Jun 2004 19:45:01 +0400
Message-ID: <200406021945.01933.vitaly@namesys.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <200406021658.17346.vitaly@namesys.com> <200406021604.49333.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9XfvAbTfXZigp5M"
Return-path: <reiserfs-list-return-18972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406021604.49333.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

--Boundary-00=_9XfvAbTfXZigp5M
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 02 June 2004 17:04, Raymond A. Meijer wrote:
> On Wed 2 June 2004 15:58, Vitaly Fertman wrote:
> > > Tried it and got the same result: fsck.reiser4 segfaults at semantic
> > > tree checking.
> >
> > Can you provide the packed fs metadata for downloading?
> > (debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2)
>
> I have that problem too on one of my partitions! Do you want my metadata as
> well?

ok, the patch attached prevents fsck from segfaulting.
however the convertion policy has been changed in the
reiser4progs and the uptodate fsck would not have 
problems here.

I hope another reiser4progs snapshot will be available 
this week, when some debugging will be finished.
-- 
Thanks,
Vitaly Fertman

--Boundary-00=_9XfvAbTfXZigp5M
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-0.5.4_convertion.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs-0.5.4_convertion.patch"

===== plugin/object/reg40/reg40_repair.c 1.123 vs edited =====
--- 1.123/plugin/object/reg40/reg40_repair.c	2004-06-02 19:16:17.000000000 +0400
+++ edited/plugin/object/reg40/reg40_repair.c		2004-06-02 19:19:56.000000000 +0400
@@ -281,9 +281,6 @@ static int reg40_conv_prepare(reg40_t *r
 
 	info = &reg->obj.info;
 
-	if (mode != RM_BUILD)
-		return 2;
-
 	/* The current item should be converted to the body plug. 
 	   Gather all items of the same wrong plug and convert them 
 	   all together at once later. */
@@ -301,8 +298,7 @@ static int reg40_conv_prepare(reg40_t *r
 		plug_call(reg->body.key.plug->o.key_ops,
 			  get_offset, &hint->offset);
 
-	/* Convertion is postponed; do not bother with it for not RM_BUILD. */
-	return mode == RM_BUILD ? 1 : 2;
+	return 1;
 }
 
 /* Obtains the maxreal key of the given place.

--Boundary-00=_9XfvAbTfXZigp5M--

