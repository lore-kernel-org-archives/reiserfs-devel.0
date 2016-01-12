From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Tue, 12 Jan 2016 00:34:25 -0800
Message-ID: <CAM12Q5SHuUis4ayd6dtJSpHrcxfpXUWYrkyQ8Uj16t_UGMoEdg@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<CAM12Q5Rt-X2SXc1bSuU-h-zDxPfBUqdJkRhY2fKs4kXUYbOwAA@mail.gmail.com>
	<20160111084732.48bf9447@multivac.localdomain>
	<20160111062221.GC23329@mraw.org>
	<20160111190158.58dc383f@multivac.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=Qj/uSrPHjKd7blwNBeRFBGSNvvxht/8z+YMzq/tdGU0=;
        b=pem9KIZpxWww24x1lRcLzDWu1h8qIiGg3wmUDH4//gBPEgx+YyDgGDwJCglhcne6t0
         MUgSZh2rYtcvk9oGT7VuzWSRXtrl0TU5qml94mmPTgwQl19bphVHtStgywRrcnMB84kp
         YQPkKBCEH/BI0wM4AUBnkO43IyFnk98Woh0iqwp3uVMFz73VWtZfFjXT3pibWI5nXbC2
         MKEQBKTE3cJt02DJYB5h0RYqXtuAVzU5j+voV6WLU+ieUJusdXJhFof8GU0AdzqwBWLq
         tClilbLLTKNkf+hxW5MJHqwl0S7sYhDxmQ3qKJwhkS0FlCQylEEYh0Vhx/CGLd+FjBdu
         OPzg==
In-Reply-To: <20160111190158.58dc383f@multivac.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Adam Wilson <moxalt@riseup.net>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Mon, Jan 11, 2016 at 8:01 AM, Adam Wilson <moxalt@riseup.net> wrote:
> On Mon, 11 Jan 2016 07:22:21 +0100
> Cyril Brulebois <kibi@debian.org> wrote:
>
>> Adam Wilson <moxalt@riseup.net> (2016-01-11):
>> > This is somewhat off-topic, but why was ReiserFS support removed
>> > from d-i? I am a big fan of Reiser3 personally, but I use XFS now.
>>
>> In linux's changelog:
>> | linux (3.10.1-1) unstable; urgency=3Dlow
>> | [=E2=80=A6]
>> |   * udeb: Remove obsolete and unsupported drivers and filesystems
>> |     - Remove ppa from scsi-modules
>> |     - Remove floppy-modules, irda-modules, parport-modules,
>> plip-modules, |       qnx4-modules, reiserfs-modules, ufs-modules
>> | [=E2=80=A6]
>> |  -- Ben Hutchings <ben@decadent.org.uk>  Tue, 16 Jul 2013 02:06:53
>> +0100
>>
>> It seems it was already being phased out in d-i a few years before
>> that: https://www.debian.org/devel/debian-installer/News/2010/201010=
30
>
> That is interesting. I distinctly remember the 'ReiserFS' filesystem
> option being present in the Wheezy d-i. The description went somethin=
g
> like this: 'Journaling filesystem created by Hans Reiser' or somethin=
g
> along those lines. Your research has revealed otherwise- but I have m=
y
> suspicions. I'm sure I didn't make up that experience.
>
> Perhaps I somehow inadvertently customised my copy of d-i or did an
> advanced install or something, but I doubt it. I was even more inept =
a
> year ago than I am now.
>
> Why was Reiser3 phased out? It wasn't *grossly* unstable or anything,
> and despite lack of maintenance it was still a good little filesystem
> that could have stayed for longer.
>
> And why UFS? It may be obsolete, but I should think it would be
> relatively stable. Surely a filesystem should only be removed when it
> is actually a steaming wreck,

"not just when the devs don't like it anymore."

You just hit the nail on the head ;-)
https://pbs.twimg.com/media/CWM_CVsUAAAqFSX.png:large

Seems only large organizations have the financial resources to
whitewash their monstrous past and have their code accepted. For an
unfortunate individual like Reiser, well, tough luck -- as FOSS' often
touted technical meritocracy of code selection process is simply
trumped over by a selective 'morality', selective 'altruism', and/or
'religious' (or X) other sort of *unspoken* agreement/fanaticism by
upstream maintainers (gate keepers?).
http://marc.info/?l=3Dreiserfs-devel&m=3D144979771308703&w=3D2

Oh, yes, the 'extra cherry on top' by someone 'commenting' at the end
-- throwing extra dirt -- dissing the individual and/or his work/code.
That's the pattern I have observed.


Best Professional Regards.

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
