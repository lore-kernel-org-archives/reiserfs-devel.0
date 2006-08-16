From: Benjamin Vander Jagt <benjamin@winchesterpc.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing,
 CARRY_DOING)
Date: Wed, 16 Aug 2006 06:32:42 -0700 (PDT)
Message-ID: <5832497.post@talk.nabble.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608031928.25155.zam@namesys.com> <200608062224.43728.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608101355.29298.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608111315.17116.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608111315.17116.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com




Vladimir V. Saveliev wrote:
> 
> Hello
> 
> What kernel do you use? Recently we had few fixes of such problem.
> 
> 

I am having the exact same problems but with one difference.  After a while,
the drive starts thrashing, and the system becomes totally unresponsive.  I
have no way of knowing what it's doing, and I've tried leaving it alone for
as much as 24 hours, and it just doesn't stop.  So far I don't see any data
loss.  I am running 2.6.17 vanilla + reiser4 patch "2.6.17-3".  There are no
signs of hardware errors, but I'll run a full hard drive test next just to
be sure.

Here's what dmesg says right now:

reiser4[find(26470)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1
reiser4[find(26470)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 876827 (-2)
reiser4[syslog-ng(2407)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1
reiser4[syslog-ng(2407)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1
reiser4[udevd(883)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1
reiser4[udevd(883)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1
reiser4[udevd(883)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
WARNING: Wrong level found in node: 2 != 1

Then it says this message about 50 times:
reiser4[find(26470)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 876827 (-2)

Then it says this:
reiser4[find(26470)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?

Andrew, may I ask for the contents of your /proc/meminfo file?  I noticed
now that I have made a typo in my fstab and have never had swap space on
this computer.  I also found a lot of OOM errors earlier in dmesg.  I'll be
putting swap back in now and see if it fixes anything.

-Benjamin Vander Jagt
-Vander Jagt Computers
-- 
View this message in context: http://www.nabble.com/-nikita-3002-%3A-assertion-failed%3A-carry_level_invariant%28doing%2C-CARRY_DOING%29-tf2042550.html#a5832497
Sent from the ReiserFS - General forum at Nabble.com.

