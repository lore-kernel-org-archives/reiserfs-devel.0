From: Oleg Drokin <green@namesys.com>
Subject: Re: Identifying files with badblocks
Date: Mon, 9 Jun 2003 13:17:12 +0400
Message-ID: <20030609091712.GA25225@namesys.com>
References: <200306082316.05818.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200306082316.05818.felix.klee.reiserfs@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Jun 08, 2003 at 11:16:05PM +0200, Felix E. Klee wrote:
> I am using a ReiserFS 3.6 formatted IBM-DJSA-220-ATA-harddisk with SuSE 
> LINUX 8.2. Today, by using 
>     badblocks -s /dev/hda under LINUX 
> and IBM/Hitachi's
>     Drive Fitness under DOS, 
> I found that the drive contains a continuous section of bad blocks. The 
> Drive Fitness Utility has an option to repair the corresponding sector but 
> this will destroy all data in it. This is OK, but I need to know what data 
> is destroyed so that I can recreate it later. So, now my question:
> How do I find out which files correspond to certain bad blocks on my Reiser 
> file system?

Well, you can do
debugreiserfs -d /dev/your_device >somefile.
then lookup the blocknumber there as text string.
This will give you file's key.
Then lookup the direntry by this key.

Bye,
    Oleg
