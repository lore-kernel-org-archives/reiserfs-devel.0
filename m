From: <mail@viliar.net.ru>
Subject: Re: 2.6.16+reiser4+openvz patches = error.
Date: Wed, 12 Jul 2006 17:49:01 +0400
Message-ID: <web-9762893@inc.ru>
References: <44B4FB40.807@rosettastone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B4FB40.807@rosettastone.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Uhrain <buhrain@rosettastone.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Yes, please, post it. 

On Wed, 12 Jul 2006 14:38:08 +0100
 Brian Uhrain <buhrain@rosettastone.com> wrote:
> Hi,
> 
> I've played around with OpenVZ on my workstation at work, and the compilation problem is because
> the OpenVZ patch adds an extra argument to generic_permission to accomodate the more complex
> permission handling it has to do (e.g. no process, regardless of the UID, from a virtual server
> instance is allowed access to files outside of it's root directory, virtual servers themselves
> can be given disk quotas, etc; I don't remember exactly what the extra field was for as it was
> several months ago that I poked at the code to get it to compile).  However, though I was able to
> get reiser4 to compile with the OpenVZ patches, the fixing I did only allowed it to compile.  Not
> knowing the full scope of the reiser4 code nor the OpenVZ changes and how they should interact,
> OpenVZ and reiser4 don't play nicely together with the compilation fixes I made--if the virtual
> server directories were on a reiser4 filesystem then starting a virtual server would cause the
> system to hang fairly quickly.  My over-simplified solution to that problem was to put the OpenVZ
> directories in a separate partition that utilizes one of the in-kernel-tree filesystems that are
> supported by the OpenVZ patches (like reiser3 and xfs).  If anyone is interested in my compile
> fixes, let me know and I can post them tomorrow when I'm in the office.
> 
>   - Brian
> 
> 
> mail@viliar.net.ru wrote:
> > Hello All!
> > 
> > 
> > I'm trying to compile 2.6.16 kernel with this openvz patch:
> > (http://download.openvz.org/kernel/devel/026test015.1/patches/patch-026test015-combined.gz) 
> > (changes: http://openvz.org/news/updates/devel-kernel-026test015.1)
> > 
> > and with reiser4-for-2.6.16-4.patch.gz.
> > 
> > Patching is finished without errors, but in process of compilation (reiser4 - module) I get
> those
> > errors:
> >  
> >  CC [M]  fs/reiser4/plugin/object.o
> > fs/reiser4/plugin/object.c:96: warning: initialization from incompatible pointer type
> > fs/reiser4/plugin/object.c:208: warning: initialization from incompatible pointer type
> > fs/reiser4/plugin/object.c:254: warning: initialization from incompatible pointer type
> > fs/reiser4/plugin/object.c:300: warning: initialization from incompatible pointer type
> > fs/reiser4/plugin/object.c:392: warning: initialization from incompatible pointer type
> > fs/reiser4/plugin/object.c:452: warning: initialization from incompatible pointer type
> >   CC [M]  fs/reiser4/plugin/cluster.o
> >   CC [M]  fs/reiser4/plugin/inode_ops.o
> > fs/reiser4/plugin/inode_ops.c: In function 'permission_common':
> > fs/reiser4/plugin/inode_ops.c:416: error: too few arguments to function 'generic_permission'
> > make[2]: *** [fs/reiser4/plugin/inode_ops.o] Error 1
> > make[1]: *** [fs/reiser4] Error 2
> > make: *** [fs] Error 2
> > 
> > Is where any ideas, why it could be?
> > 
> > 
> > Thank you.
> > 
> > 
> > 
> > 
> > A.
> > 
> > -------------
> > 
> > "Hic Jacet Ego"




A.

--------------

"Hic Jacet Ego"
