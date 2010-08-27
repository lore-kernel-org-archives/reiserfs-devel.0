From: Nicolas Barbier <nicolas.barbier@gmail.com>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2
 vanilla kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Fri, 27 Aug 2010 09:30:15 +0200
Message-ID: <AANLkTing7GwZbLgpgaffTLy10zYsTWU_6A4ovqU3D20k@mail.gmail.com>
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
        bh=b3dn+jwCrv3g8sAiT/Y3CaJLFIMsTlvw2Lk6nudPx8Y=;
        b=CjlSs+BoiFCWuKtLVJifwsQT48RwZ1HzZqMI6CiohZN02Cw1TGwITJjlUHThYJTffM
         L9V7EiZ3iriBHhaBRSfUUJF9bvlEp4hw32kZV3LMI+mEYfHKy5przFX9/04YMH0cJ1vD
         O6buERfYqk02FtQpkwx1cnX69fvR5bnSMtN/E=
In-Reply-To: <4C76FCB4.9010404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "K. Posern" <quickhelp@gmail.com>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

2010/8/27 K. Posern <quickhelp@gmail.com>:

> On 26/08/10 15:20, Jon=C3=A1=C5=A1 Vidra wrote:
>
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

It could trigger compiler bugs and trigger unintended behavior due to
unsafe (but possibly intentional) constructs in the compiled source
code. I don't know of any case where it could fail the build, although
such cases may exist.

=46or an example of how compiler optimizations can break the generated
code (which is probably totally unrelated to your specific problem),
see:

<URL:http://en.wikipedia.org/wiki/Aliasing_(computing)#Conflicts_with_o=
ptimization>

Nicolas
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
