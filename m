From: jeff leads <jleads@yahoo.com>
Subject: Re: File Corruption
Date: Tue, 1 Oct 2002 21:07:34 -0700 (PDT)
Message-ID: <20021002040734.30121.qmail@web10501.mail.yahoo.com>
References: <20021001101050.A5833@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021001101050.A5833@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!  Below is the abbreviated version of my output
from --check.  Is it safe to run --fix-fixable?
 What do the bad nlink numbers mean?  Should I be
concerned about the dirty buffers?

Thanks again in advance!

Jeff 

], SD has bad nlink number
/  4 (of 143)bad_stat_data: block 46863, [124457 36663
0x0 SD (0)], SD has bad n
link number
/  5 (of 143)bad_stat_data: block 44550, [124457
101732 0x0 SD (0)], SD has bad
nlink number
bad_stat_data: block 44550, [124457 114743 0x0 SD
(0)], SD has bad nlink number
bad_stat_data: block 44550, [124457 124458 0x0 SD
(0)], SD has bad nlink number
bad_stat_data: block 44550, [124457 124469 0x0 SD
(0)], SD has bad nlink number
/  6 (of 143)bad_stat_data: block 63760, [124457
151128 0x0 SD (0)], SD has bad
nlink number
/125 (of 160)/ 32 (of 163)bad_stat_data: block 47631,
[143160 155080 0x0 SD (0)]
, SD has bad nlink number
bad_stat_data: block 47631, [143160 155192 0x0 SD
(0)], SD has bad nlink number
ok
Comparing bitmaps..ok
Checking Semantic tree...
/tmp/recover.2.30031file 9 106855 has wrong sd_size
56377344, has to be 60522496
file 9 106855 has wrong sd_blocks 0, has to be 118208
ok
There were found 102 corruptions which can be fixed
with --fix-fixable
check_and_free_buffer_mem: dirty buffer (3 16) found
###########
reiserfsck finished at Tue Oct  1 19:32:45 2002
--- Oleg Drokin <green@namesys.com> wrote:
> Hello!
> 
> On Mon, Sep 30, 2002 at 12:52:27PM -0700, jeff leads
> wrote:
> > Ok, I'm running RedHat 7.1, gcc 2.96-85, kernel
> > 2.4.9-21 (redhat's version) and ReiserFSProgs
> 3.6.3 (
> 
> I do not know what is included into 2.4.9-21, but
> can you upgrade to
> 2.4.18-10 (I think this is latest RedHat errata
> kernel for 7.x series of
> their distro).
> 
> > I'm starting to get file corruption here and
> there. 
> > My next question is, where do I go from here? 
> What
> 
> You need to upgrade kernel to something that
> includes all of our fixes at least
> up to 2.4.18.
> 
> > can I do to rectify this issue?  Do I run a
> rebuild at
> > this point?  What caused this?  
> 
> This is hard to tell what have caused this.
> Can you please send us reiserfsck output from the
> same partition,
> but take reiserfsck from ReiserFSProgs 3.6.3?
> 
> > Sep 30 14:03:11 goku kernel: is_tree_node: node
> level
> > 64680 does not match to the expected one 1
> 
> This is on disk metadata corruption, but the reason
> is unknown
> 
> > [root@goku /root]# reiserfsck /dev/ida/c0d0p5
> > <-------------reiserfsck, 2001------------->
> > reiserfsprogs 3.x.0j
> 
> This is too old to be used today.
> 
> Bye, 
>     Oleg 


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
