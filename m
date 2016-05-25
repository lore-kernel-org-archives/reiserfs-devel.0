From: <doiggl@velocitynet.com.au>
Subject: Re: Two Reiser4 FSs in the same HDD cause head seek panic?
Date: Wed, 25 May 2016 20:22:05 +1000
Message-ID: <3ba9c56a60bb5f4e6d9f6e3bb867ebe3@mail.velocitynet.com.au>
References: <ni15m1$hf6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ni15m1$hf6$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Georgios Tsalikis <georgios@tsalikis.net>
Cc: reiserfs-devel@vger.kernel.org

On Tue, 24 May 2016 11:58:53 +0300, Georgios Tsalikis
<georgios@tsalikis.net> wrote:
> I happened to format a rootfs partition and another one for /home with 
> Reiser4. It proved to be a disaster. Apart from the slow boot times 
> (expected from this drive) even after reaching a functional GUI the 
> disk kept doing I/O  like crazy. When /home became Btrfs the issue 
> ceased. My other computer that uses an entire drive formatted with 
> Reiser4 is nice and silent as well.
> 
Hello,
As far as I know you have to boot with a Reiser4 enabled kernel to read
reiser4 filesystem.
--Glenn

# lsmod |grep -i reiser4
Module                  Size  Used by
reiser4               442368  0

# cat /proc/filesystems  |grep -i reiser4 |sort
        reiser4

--Glenn
