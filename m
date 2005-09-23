From: Edward Shishkin <edward@namesys.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Fri, 23 Sep 2005 13:00:29 +0400
Message-ID: <4333C42D.2060805@namesys.com>
References: <194f625505092006316ad200b5@mail.gmail.com>	 <2f4958ff05092208244a0496fc@mail.gmail.com>	 <4332DE9F.8010808@namesys.com>	 <200509221951.38302.namesys.Sch@ttgen.net>	 <43330E14.9050209@namesys.com> <4333100F.6080307@slaphack.com>	 <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu> <b14e81f00509221354348a431b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00509221354348a431b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael chang <thenewme91@gmail.com>
Cc: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>, David Masover <ninja@slaphack.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

michael chang wrote:

>Second, will plugins be layerable, e.g. can I use a compression plugin
>and a _seperate_ encryption plugin on the _same_ file,
>

There is a number of specific attributes including compression and 
encryption
transform plugin ids, so user can assign it separately when creating a file.
If you dont want some transform to be present, you should assign a special
"none" plugin id for this transform.

> and then if so,
>can I choose which order in which they take effect?
>  
>

What effect do you mean?
The order is hardcoded and can not be changed: compression is first.

Edward.

>--
>~Mike
> - Just my two cents
> - No man is an island, and no man is unable.
>
>
>  
>

