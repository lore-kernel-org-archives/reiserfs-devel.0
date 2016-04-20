From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Debian with Reiser4-patched Linux kernel on IBM Power8
Date: Wed, 20 Apr 2016 04:23:58 -0700
Message-ID: <CAM12Q5TfuL2fF9jO_GHDDK5eXoQp1mYCFynvDYydOdoXPJhPZA@mail.gmail.com>
References: <CAM12Q5Tu-Zg=wgUAbYh++0dwn-h8gNUNMraxFgVWCi-HzUpyJA@mail.gmail.com>
	<op.yf7tcmn9hogzsi@i17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-transfer-encoding;
        bh=cfHGnZGjecRCwbwCWl6qYN5hv9V9JU8fCTcHBDaQdgU=;
        b=GRwebVaC0buQASDdupB0kw3tyU7oV171zaY8pmx1FCtC7guW5aARQpzaIEJn4boE3a
         QJASplESl/pPnBOytHH2t6irQl8XoDr9wksMWxenzWKahFYdXeNaV8OPO2kSayXvzvVu
         bSsPjZZCuprBOPuA4Mr+DcZHSDNQNZ1mujBALG6d1UkE83ct2eymFF2ziDi8RgSCnKUX
         FQCCzhLlP30SRFuS/C1m9mycGI7wjhbKCbrjSTaf67LMnsGGqMghhyeUodYgUG3LP6/p
         FOpW3mwtEf3yn/Zia1V8cfbFWQ1THdRozZHnviawwIz+jutYZR50fz0dQs2xRsVYP1oi
         Vv+A==
In-Reply-To: <op.yf7tcmn9hogzsi@i17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-kernel@lists.debian.org, debian-boot@lists.debian.org

On Wed, Apr 20, 2016 at 4:11 AM, Jon=C3=A1=C5=A1 Vidra <vidra.jonas@sez=
nam.cz> wrote:
> On Wed, 20 Apr 2016 12:53:48 +0200 Jose R R <Jose.r.r@metztli-it.com>=
 wrote:
>
>> is there any reason why Reiser4 SFRN 4.0.1-enabled Debian should not
>> run on Power8? I assume GPT should be selected whereas previously I
>> have tested -- on AMD64 baremetal and cloud -- only MSDOS disk
>> partitioning.
>
>
> There might be some problems with the endianness of the system.
>
> I have tested Reiser4 on 32bit PowerPC several years ago and as far a=
s I
> remember, mounting and using a preformatted partition (mkfs done on a=
n x86
> machine) was possible, but a partition formatted on PowerPC was unusa=
ble.
> I can repeat the tests, if you are interested.

No, I won't bother you with that. Just gathering some preliminary
information prior to efforts at building the PPC Reiser4 UDEB module
for my Debian-Installer (d-i) hack.

Thank you much for your insight on 'endianness of the system'.


Best professional Regards.


--=20
Jose R R
http://metztli.it
-----------------------------------------------------------------------=
----------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
-----------------------------------------------------------------------=
----------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy =
way!
-----------------------------------------------------------------------=
----------------------
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
