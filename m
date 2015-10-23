From: Georgios Tsalikis <georgios.tsalikis@hol.gr>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Fri, 23 Oct 2015 16:24:37 +0300
Message-ID: <BLU436-SMTP91B2FD2E48BAC63569BFCE9B260@phx.gbl>
References: <n0b6ql$6t4$1@ger.gmane.org>
 <CAM12Q5Rwja+qYO1AfcYmBsCWOfk+8_Y_VgtLn4zBJ17GiP5row@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5Rwja+qYO1AfcYmBsCWOfk+8_Y_VgtLn4zBJ17GiP5row@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose R R <jose.r.r@metztli.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello :)

> Niltze!
>
> On Thu, Oct 22, 2015 at 10:38 AM, Georgios Tsalikis
> <georgios@tsalikis.net> wrote:
>> The filesystem is 1.7GB large, lies in a GPT patition and is formated with
>> -o node=node41
> In this test machine(s) my partitions are not GPT
>
>> without any other override. The kernel is 4.2.3 with the
>> 4.2.2 patch.
> I am running similar combination; mount time of ~60GB & ~50GB
> partitions (at least one previously formatted: -o create=reg40) with
> *existing data*  is under 8 seconds.
>
>> I tried the same on a 250MB partition and it mounts instantly. dmesg shows
>> nothing special
>> Any ideas?
> Tried formatting a ~24GB non-GPT partition with options as you
> specified; the mount time was under 3 seconds for the newly formatted
> partition:
> https://pbs.twimg.com/media/CR-zkQtVAAA5D_G.png:large

> I noticed that yours uses 4096K block size. My partition uses 64K. Is this
> due to the much larger size of my partition? Maybe it is the problem behind the delay?
> I have no idea if GPT makes a difference.
>> Thanks in advance. :)
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

