From: melodramus@online.de
Subject: (nearly) full hd causes weird and corrupting behaviour of apps and
 tools
Date: Mon, 19 Apr 2010 17:02:23 +0200
Message-ID: <20100419170223.1418c33d.melodramus@online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

am not shure if i'm right here. i'm still using reiserfs on my root partition and detected strange behaviour when the partition is believed to be 100% full by the system (namely df, though there may still be a hundred megs available.) because of the widespread disorientation of tools and apps i believe that the fs-driver is not telling the truth about the available physical space.

lots of apps get into trouble, loose their states or configure widgets wrong. for example, sylpheed can't check against certificate servers anymore, the firefox download dialog can't list new entries but downloads them in background while halting complete downloads on their last few seconds and refusing to restart or delete the entries. this could all be just the apps but even the system tools behave strange. i copied an old backup cd to a new backup hd, grabbing the iso and loop-mounting it on the hd for faster access. at some point, tools showed up wrong information. df even showed old information about previous mounts from where ever it got that back. i detected that the system log has grown to about hundred megs because of lots of usb events (for the backup hd.) after having deleted th
 e logfile, df even showed less available memory than before (some kb.) mount refused to unmount partitions, which caused me to restart the system.

in the new session df showed about 143 MB of free space for the root partition. things seemed to work again but, though the iso loop-mounted fine, i wasn't able to read files from it anymore because of io-errors all through (the next iso worked fine.) seems that mount has even scratched this iso. this is why i believe that the current situation is really dangerous, though a full root partition is possibly not that common.

MeloDramus <melodramus@online.de>
