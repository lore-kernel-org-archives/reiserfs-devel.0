From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: More Slowdown - testscript [noatime,nodiratime]
Date: Thu, 24 Nov 2005 11:13:39 +0100
Message-ID: <43859253.1050900@ursynow.2a.pl>
References: <437CBC63.3050202@namesys.com> <43820CAD.3090605@namesys.com>	 <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com>	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>	 <1132709496.7650.24.camel@teratron.lan.etheus.net>	 <1132710424.7328.7.camel@teratron.lan.etheus.net>	 <1132777409.7458.8.camel@teratron.lan.etheus.net>	 <43854668.8010000@namesys.com> <20051124074909.GB8307@favonius> <3aa654a40511240141u770c657br18fe2cd618c4f479@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40511240141u770c657br18fe2cd618c4f479@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Avuton Olrich wrote:
> On 11/23/05, Sander <sander@humilis.net> wrote:
>> Please don't forget that the behavior without 'noatime' is new. I never
>> had my disk mounted 'noatime', and until recently did not experience the
>> huge slowdown. I assume the other people who reported this agree.
>>
>> So whether or not fsync needs to be optimized, something changed in
>> Reiser4 or -mm that causes the huge slowdown.
> 
> Agreed, I have mounted with noatime nodiratime and still get time when
> interactivity is extremely poor. Mostly with the vim test. I'm not
> sure the problem is /fixed/ but it does seem much better.
> 

I also agree, i see improvement, but there was a time when noatime 
nodiratime wasn't needed to not cause slowdowns. But i'm sure i will 
leave noatime/nodiratime set to off anyways, as this is mot much useful 
for me.


