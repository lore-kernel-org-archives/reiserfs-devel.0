From: Jordan Patterson <jordanp@gmail.com>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2
 vanilla kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Thu, 26 Aug 2010 17:58:50 -0600
Message-ID: <AANLkTi=EjdZO26VKB7HBdS=Qup1DAorPmJOZEohmhCwq@mail.gmail.com>
References: <4C75BCBF.6010009@gmail.com>
	<op.vh1ct9tghogzsi@g17b>
	<4C76633D.9010106@gmail.com>
	<op.vh17zoyrhogzsi@g17b>
	<4C76FCB4.9010404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=duXupUFDF2kQQFRntY/sweLpdn2150KtezcHi/TwiZQ=;
        b=Ta45/cFsgEsWr0E1tzHFU8CYtWbQTbJJsqCXi/Ddk2FGBUV5UYzeM3+fpNcMDeb3X5
         he/QKUOLsPHqsJiGkVY2w7u8mUYuKq9jFfRbW3IMmzVtW6qN0cuB+gMZPLxh+acxBViS
         AeIGvSdaGJCWL4MyCyIOmvmunEKeEbMaRBD4s=
In-Reply-To: <4C76FCB4.9010404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "K. Posern" <quickhelp@gmail.com>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Hi:

I have a 64-bit Gentoo install, and I would get the same kernel bug
when trying to emerge some java applications, such as ant-base.  This
happened with the 2.6.35 and 2.6.34 kernels.

I was using ccreg40 with lzo compression.

My CFLAGS are "-march=3Dcore2 -O2 -pipe", which shouldn't have been a
problem.  I'm not using reiser4 any more, so I can only confirm this
bug.

Jordan

On Thu, Aug 26, 2010 at 5:45 PM, K. Posern <quickhelp@gmail.com> wrote:
> Hi,
>
> On 26/08/10 15:20, Jon=C3=A1=C5=A1 Vidra wrote:
>>
>> Could you, please, recompile both the kernel and reiser4progs
>> (and possibly their dependencies :D) with -O2 instead of -O3
>> in CFLAGS? It tends to break things in strange and nasty ways,
>> why do you have it enabled globally like this? Are you sure
>> it's actually needed?
>
> I had read around and found comments that it can actually make things=
 faster
> and so I decided to give it a try.
> You said "break things in strange and nasty ways":
> Does this mean it can compile well and then just not WORK right (like=
 for
> example: mkfs.reiser4 doing the wrong things when formatting)??
> I only heard that it can break the compilation, no? And for me everyt=
hing
> compiled fine.
>
> The difference between -O2 and -O3 are these 6 options:
>> =C2=A0 -fgcse-after-reload =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [enabled]
>> =C2=A0 -finline-functions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enabled]
>> =C2=A0 -fipa-cp-clone =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enabled]
>> =C2=A0 -fpredictive-commoning =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enabled]
>> =C2=A0 -ftree-vectorize =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enabled]
>> =C2=A0 -funswitch-loops =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enabled]
>
> Can you maybe comment on them?
>
> ... Because I could also use O2 and turn on some of them...
> I was told: -ftree-vectorize and -funswitch-loops should be good and =
maybe
> -fpredictive-commoning?!
>
>> Also, CCache is not used anymore, remove it from FEATURES.
>> If you actually _use_ CCache (i.e. you've installed it
>> manually), unmerge it immediately. It's broken by design.
>>
>> Other stuff in your FEATURES looks fishy as well, but it
>> shouldn't affect builds. I hope you know what you're doing.
>
> Thanks! I used your comment to review my features again :)
> ... and I disabled CCACHE.
>
> If you don't mind: Now I am interested in your feedback about the oth=
er
> features:
>
> These should be 100% secure, right:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0buildsyspkg -- secure I guess ;) ... and I=
 like it in case something
> f's up big-scale in portage and I start emerging ;) ... happened once=
 to a
> friend of mine ... just try to use portage when python is broken ;)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0collision-protect -- useful I find
> =C2=A0 =C2=A0 =C2=A0 =C2=A0parallel-fetch -- faster downloads who doe=
n't want that
> =C2=A0 =C2=A0 =C2=A0 =C2=A0metadata-transfer -- necessary for sqlite =
with portage (afaik)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0noauto -- convenient
> =C2=A0 =C2=A0 =C2=A0 =C2=A0noinfo -- I just don't use "info"
>
> SECURITY - Drop-Priviledges
> --> should if things compile also be fine, right?
> =C2=A0 =C2=A0 =C2=A0 =C2=A0userpriv usersandbox userfetch usersync
>
> SECURITY - MISC:
> --> These I like for some additional (security) checking:
> (I guess about them and the File-Permissions I am the most interested=
 in
> your opinion)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sandbox - seems also useful to me, no?
> =C2=A0 =C2=A0 =C2=A0 =C2=A0strict - seems like a good thing from the =
description
>
> SECURITY - File-Permissions
> <<< they might be scetchy, right?... but should not do /harm/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sfperms
> =C2=A0 =C2=A0 =C2=A0 =C2=A0suidctl
>
> Thanks a lot!
>
> Knuth
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
