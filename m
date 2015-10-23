From: Georgios Tsalikis <georgios.tsalikis@hol.gr>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Sat, 24 Oct 2015 01:06:27 +0300
Message-ID: <BLU436-SMTP17E43BAB1F0262E99F242F9B260@phx.gbl>
References: <n0b6ql$6t4$1@ger.gmane.org> <1445636264.2412.0.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1445636264.2412.0.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

On 24/10/2015 12:37 =CF=80=CE=BC, Ivan Shapovalov wrote:
> On 2015-10-22 at 20:38 +0300, Georgios Tsalikis wrote:
>> The filesystem is 1.7GB large, lies in a GPT patition and is formate=
d
>> with -o node=3Dnode41 without any other override. The kernel is 4.2.=
3
>> with
>> the 4.2.2 patch.
>> I tried the same on a 250MB partition and it mounts instantly. dmesg
>> shows nothing special
>> Any ideas? Thanks in advance. :)
> Hello,
>
> try "dont_load_bitmap" in mount options. However, this is anyway very
> strange for a ~2GB partition...

I am sorry, did i write 1.7GB? I meant 1.7TB... i am old and such figur=
es dont fit my mind easily!

>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-
>> devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
