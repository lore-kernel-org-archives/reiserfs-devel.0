From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 infinite loop
Date: Tue, 16 Mar 2004 18:15:34 +0300
Message-ID: <200403161815.34110.vitaly@namesys.com>
References: <405597B6.1000906@free.fr> <200403161654.48374.vitaly@namesys.com> <4057158D.5090201@free.fr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_WoxVAu6KWou3ODE"
Return-path: <reiserfs-list-return-17248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4057158D.5090201@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vince <fuzzy77@free.fr>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-00=_WoxVAu6KWou3ODE
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 16 March 2004 17:56, Vince wrote:
> Vitaly Fertman wrote:
> > thank you for hitting this, I have attached the updated patch for
> > reiser4progs. it should cure for the problem, email me about your results
> > please.
>
> It looks that I'm quite good at hitting bugs ;-)

good day.

> Ok, yet another problem: fsck.reiser4 on my other reiser4 partition
> loops on some entry. I can pack the metadata and make it available if
> needed, for now here is the log:

I see the problem, although not sure that the attached patch will 
fix it correctly. If it does not, I need to have a look at the metadata.

p.s. waiting for other bug reports :)

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_WoxVAu6KWou3ODE
Content-Type: text/x-diff;
  charset="koi8-r";
  name="dir40_check.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dir40_check.patch"

===== plugin/object/dir40/dir40_repair.c 1.88 vs edited =====
--- 1.88/plugin/object/dir40/dir40_repair.c	Thu Mar 11 22:01:47 2004
+++ edited/plugin/object/dir40/dir40_repair.c	Tue Mar 16 18:07:00 2004
@@ -316,6 +316,10 @@
 
 
 			if (mode != RM_BUILD) {
+				/* If not the BUILD mode, continue with the 
+				   entry key, not the correct one. */
+				plug_call(key.plug->o.key_ops, assign,
+					  &key, &entry.offset);
 				res |= RE_FATAL;
 				goto next;
 			}

--Boundary-00=_WoxVAu6KWou3ODE--

