From: Dirk Mueller <dmuell@gmx.net>
Subject: Re: Howto reformat root partition
Date: Tue, 9 Apr 2002 12:50:47 +0200
Message-ID: <20020409105047.GA30683@matrix.wg>
References: <OF64BE5856.EE2EDA07-ONC1256B96.0031B944@ev-i.at>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF64BE5856.EE2EDA07-ONC1256B96.0031B944@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Die, 09 Apr 2002, wolfgang.glas@ev-i.at wrote:

> 
>    I tried to add the conv option to /etc/fstab for my reiserfs root 
> partition and did lose. I had to boot from CD, mount my root partition, 
> reformat it using v3.6 disk format, copy the old content back, reboot the 
> new root partition from CD and re-run lilo.

reformat it ?

Boy, just use mount -oconv _once_ from the rescue system you booted. 

Don't tell such horror stories here ;-)


Dirk
