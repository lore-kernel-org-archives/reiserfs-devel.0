From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Thu, 29 Oct 2015 14:21:56 +0200
Message-ID: <n0t2tc$hm1$1@ger.gmane.org>
References: <n0b6ql$6t4$1@ger.gmane.org> <1445636264.2412.0.camel@gmail.com>
 <BLU436-SMTP17E43BAB1F0262E99F242F9B260@phx.gbl>
 <B4C46971-499C-4275-A153-D0FE220401D3@gmail.com>
 <BLU436-SMTP14768256E7F72AB73706D159B250@phx.gbl>
 <1445726364.7642.6.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1445726364.7642.6.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 25/10/2015 01:39 =CF=80=CE=BC, Ivan Shapovalov wrote:
> On 2015-10-24 at 22:41 +0300, Georgios Tsalikis wrote:
>> On 24/10/2015 01:58 =CF=80=CE=BC, Ivan Shapovalov wrote:
>>>> 24 =D0=BE=D0=BA=D1=82. 2015 =D0=B3., =D0=B2 1:06, Georgios Tsaliki=
s <georgios.tsalikis@hol
>>>> .gr> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>>>>
>>>>> On 24/10/2015 12:37 =CF=80=CE=BC, Ivan Shapovalov wrote:
>>>>>> On 2015-10-22 at 20:38 +0300, Georgios Tsalikis wrote:
>>>>>> The filesystem is 1.7GB large, lies in a GPT patition and is
>>>>>> formated
>>>>>> with -o node=3Dnode41 without any other override. The kernel is
>>>>>> 4.2.3
>>>>>> with
>>>>>> the 4.2.2 patch.
>>>>>> I tried the same on a 250MB partition and it mounts
>>>>>> instantly. dmesg
>>>>>> shows nothing special
>>>>>> Any ideas? Thanks in advance. :)
>>>>> Hello,
>>>>>
>>>>> try "dont_load_bitmap" in mount options. However, this is
>>>>> anyway very
>>>>> strange for a ~2GB partition...
>>>> I am sorry, did i write 1.7GB? I meant 1.7TB... i am old and such
>>>> figures dont fit my mind easily!
>>> Ah, so it's 1.7 TB? Then it's not unusual at all. Indeed, try
>>> mounting with `-o dont_load_bitmap`.
>>>
>> I did so and it worked. Thank you. But what does that option do?
> This option tells reiser4 to load bitmap blocks on demand, and not al=
l
> at once at filesystem mount time.
Does this mean using this option means a penalty? Maybe in some cases=20
(servers etc) it is worth waiting the fs to mount?
>
> The bitmap is how reiser4 stores information about which on-disk bloc=
ks
> are allocated and which are free (one bit corresponds to one block,
> hence the name).
>
> The 2TiB filesystem has 2*1024^4 / 4096 =3D 536870912 blocks, which t=
ake
> 536870912 / (8*4096) =3D 16384 bitmap blocks, so it takes 120/16384 ~=
 7ms
> to load one block, which is not that unusual (given that the bitmap
> loading doesn't seem to be optimized too well: each block is read in =
a
> separate request).
>
>> And which are the other options and their function?
> I'm afraid that the full list of reiser4 options can only be found in
> code (file init_super.c, functions push_sb_field_opts() and
> reiser4_init_super_data().
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
