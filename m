From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Re: Two Reiser4 FSs in the same HDD cause head seek panic?
Date: Thu, 26 May 2016 03:15:55 +0300
Message-ID: <ni5eto$gkr$1@ger.gmane.org>
References: <ni15m1$hf6$1@ger.gmane.org>
 <3ba9c56a60bb5f4e6d9f6e3bb867ebe3@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <3ba9c56a60bb5f4e6d9f6e3bb867ebe3@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 25/05/2016 01:22 =CE=BC=CE=BC, doiggl@velocitynet.com.au wrote:
> On Tue, 24 May 2016 11:58:53 +0300, Georgios Tsalikis
> <georgios@tsalikis.net> wrote:
>> I happened to format a rootfs partition and another one for /home wi=
th
>> Reiser4. It proved to be a disaster. Apart from the slow boot times
>> (expected from this drive) even after reaching a functional GUI the
>> disk kept doing I/O  like crazy. When /home became Btrfs the issue
>> ceased. My other computer that uses an entire drive formatted with
>> Reiser4 is nice and silent as well.
>>
> Hello,
> As far as I know you have to boot with a Reiser4 enabled kernel to re=
ad
> reiser4 filesystem.
> --Glenn
>
> # lsmod |grep -i reiser4
> Module                  Size  Used by
> reiser4               442368  0
>
> # cat /proc/filesystems  |grep -i reiser4 |sort
>          reiser4
>
> --Glenn
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
It is implied that my kernel is patched and both / and /home were=20
mounted as Reiser4

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
