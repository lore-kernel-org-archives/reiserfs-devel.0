From: Oleg Drokin <green@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 5 Aug 2003 16:54:31 +0400
Message-ID: <20030805125431.GE13689@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc> <20030805104546.GA22557@namesys.com> <3F2FA2DF.3050505@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F2FA2DF.3050505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Tue, Aug 05, 2003 at 04:28:15PM +0400, Hans Reiser wrote:
> >>But while rebuilding the tree, I got a segmentation fault. Because I 
> >>didn't
> >>want to continue work on the original raid system, I copied the entire 
> >>raid
> >>disk to the IDE disk.
> >>dd  if=/dev/rd/c0d0  of=/dev/hda conv=noerror,sync
> >>I tried to rebuild the fs structure again, and  I was able to access many
> >>files, but not that are important to me :(
> >>Does there is anyting I can do in this state ? does other tools then
> >>resierfsck exist ?
> >If you are not using latest fsck version (3.6.11 as of now), try to use 
> >reiserfsprogs 3.6.11,
> >as there is slight chance it would do better.
> rephrase that as, use 3.6.11, if it still fails, tell us, the segfault 
> will at least be fixed regardless of whether fsck has enough data to do 
> its job.

But it was not failing on the IDE drive anyway.

Bye,
    Oleg
