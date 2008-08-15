From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on dmcrypt
Date: Fri, 15 Aug 2008 19:44:06 +0400
Message-ID: <48A5A446.1000106@gmail.com>
References: <48A59695.5030701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48A59695.5030701@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Aagaard <aagaande@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Anders Aagaard wrote:
> Hi
>
> Been trying to move my home directory over to reiser4, and I ran into
> some issues, this is what I did:
>
> PASSCODE="temptest"
> echo $PASSCODE | cryptsetup luksFormat /dev/sdf6 -c
> twofish-cbc-essiv:sha256 -s 256
> echo $PASSCODE | cryptsetup luksOpen /dev/sdf6 tempHome
> mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/mapper/tempHome
>
> mount -t reiser4 -o noatime /dev/mapper/tempHome /mnt/x
>
> rsync -vax --progress /home/neuron/ /mnt/x/
>
> During rsync I noticed this in top while moving over a virtualbox image:
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
>  2427 root      20   0     0    0    0 R  100  0.0  14:32.01 pdflush
>  9497 root      20   0     0    0    0 R  100  0.0  11:38.48 rsync
>
> It did continue, but I figured something was wrong, so I interrupted
> the rsync and unmounted.  The rsync reported my copy speed was down to
> 3-4mb/sec.  This is on a fairly new quad core, so I should be able to
> encrypt and compress the data without difficulty.
>

Yeah, something goes wrong..
Would you please try default (reg40) plugin in the same configuration?

Thanks,
Edward.

> I remounted and started again, it starts by coping at 14-15mb/sec, and
> then just slows down as pdflush hits 100% cpu usage.  Iowait also goes
> down to around 5%.  When I interrupt it pdflush disapears instantly,
> and rsync sticks around for 10-15 seconds (making it unmountable for
> that period) until it dies.
>
> The file it's having problems with is a 6.8gb virtualbox image I use
> as a gentoo test enviroment.
>
> Anders Aagaard
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

