From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 14:05:21 +0400
Message-ID: <200609081405.21605.vs@namesys.com>
References: <200609080951.k889pjsh014685@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609080951.k889pjsh014685@smtp.hispeed.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: grossnik.mailinglists@hispeed.ch
Cc: reiserfs-list@namesys.com

Hello

On Friday 08 September 2006 13:51, grossnik.mailinglists@hispeed.ch wrote:
> Dear all
> I did a big mistake:
> - I got bad blocks on my home partition
> - I created a badblock file using:
>   badblocks -b 4096 -s -v -o /root/hda3.bad /de/hda3
> - I tried to use reiserfstune to apply bad blocks:
>  reisefstune -B /root/hda3.bad /dev/hda3
> - The tool said I have to use reiserfsck =>
>
> $ reiserfsck --rebuild-tree --badblocks /root/hda3.bad /dev/hda3
>
> Then I provides "Yes"
>
> after 25% the --rebuild-tree  stopped saing that there were bad blocks and
> that I've to provide the -B option and a badblock file.
>
> But this is what I did (using --badblocks /root/hda3.bad).
>
> Now /dev/hda3 can't be mounted (rood inode is set to -1).
>
> I would be VERY happy if I could mount the partition read only!
>
> What can I do?
>
> Many Thx in advance
>
> Bruno
>
> Kernel is 2.6.15 (Debian)
> reiserfsck -V => 3.6.19
>
> debugreiserfs /dev/hda3:
> Filesystem state: consistent
>
> /home: Reiserfs super block in block 16 on 0x303 of format 3.6 with
> standard journal Count of blocks on the device: 4883760
> Number of bitmaps: 150
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 4883760 Root block: 0
> Filesystem is clean
> Tree height: 65535
> Hash function used to sort names: "r5"
> Objectid map size 614, max 972
> Journal parameters:
> 	Device [0x0]
> 	Magic [0x78b2a94e]
> 	Size 8193 blocks (including 1 for journal header) (first block 18)
> 	Max transaction length 1024 blocks
> 	Max batch size 900 blocks
> 	Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 500386
> UUID: f4fcb46d-04da-43c9-918d-2ef00f8d8412
> LABEL: /home
> Set flags in SB:
> 	ATTRIBUTES CLEAN
>
>
>
> cat /root/hda3.bad
> 4602176
> 4602179
> 4602180
> 4602181
> 4602182
> 4602183
> 4602185
> 4602186
> 4602187
> 4602188
> 4602189
> 4602190
> 4602191
> 4602193
> 4602194
> 4602195
> 4602196
> 4602197
> 4602198
> 4602199
> 4602201

please run 
for i in `cat /root/hda3.bad`; do debugreiserfs -1 $i /dev/hda3 > /dev/null; 
done

and let me see the output
