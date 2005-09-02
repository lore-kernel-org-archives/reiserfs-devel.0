From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Incite into reiser5?
Date: Fri, 02 Sep 2005 13:36:34 -0600
Message-ID: <873bonuurh.fsf@evinrude.uhoreg.ca>
References: <1125596442.5207.11.camel@jove> <b14e81f0050901193220855450@mail.gmail.com>
 <1125685758.9150.8.camel@jove> <43189B26.2030602@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43189B26.2030602@slaphack.com> (David Masover's message of
 "Fri, 02 Sep 2005 13:34:14 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, 02 Sep 2005 13:34:14 -0500, David Masover <ninja@slaphack.com> said:

> Lares Moreau wrote:
>> I'm looking into it because I am looking into doing a masters
>> focusing on distributed file systems.  There was a mention of reiser5
>> being distributed.
>> I'm intruiged by the plugin system of reiser4, and I am looking into
>> generating a distributed plugin.

That would be great if you could get something implemented.  I think
that Linux needs a good distributed filesystem.

> I think that's the definition of reiser5.  I think that 4, 5, and 6
> (at least, maybe there's a 7?) are defined not in terms of when they
> will actually be done, but what features they will contain.  If I
> remember correctly, 6 might not need 5 to be implemented first (but
> both need 4 for its plugin architecture).

I believe that is true.  6 and 5 are orthogonal in terms of features,
and I remember Hans saying that 6 might come first, depending on what
kind of funding they get.

> Or, in other words, the version number refers to a major, sweeping
> feature.  4 is plugins, 5 is distributed, and I don't remember
> understanding 6 very well -- but I was young when I read about it.

IIRC, 6 is when we get the fancy Future Vision querying.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

