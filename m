From: Oleg Drokin <green@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 5 Aug 2003 14:45:46 +0400
Message-ID: <20030805104546.GA22557@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thorsten Mauch <mauch@imkenberg.de>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Tue, Aug 05, 2003 at 12:02:02PM +0200, Thorsten Mauch wrote:

> But while rebuilding the tree, I got a segmentation fault. Because I didn't
> want to continue work on the original raid system, I copied the entire raid
> disk to the IDE disk.
> dd  if=/dev/rd/c0d0  of=/dev/hda conv=noerror,sync
> I tried to rebuild the fs structure again, and  I was able to access many
> files, but not that are important to me :(
> Does there is anyting I can do in this state ? does other tools then
> resierfsck exist ?

If you are not using latest fsck version (3.6.11 as of now), try to use reiserfsprogs 3.6.11,
as there is slight chance it would do better.

Bye,
    Oleg
