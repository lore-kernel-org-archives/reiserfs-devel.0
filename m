From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Where Reiser4 may break?
Date: Wed, 26 May 2004 23:44:57 +0300
Message-ID: <20040526204457.GJ4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

I was thinking about some potential problems.

Actually, Nikita and I had a discussion about the issues with
cross-architecture compatibility. It would apparently not be easy to
do, because block size equals page size in Reiser4.

Is this common with other file systems? I didn't get to ask that
question so to get an answer :)

Just when stuff like FireWire and USB hard drives are getting popular
and no-one should buy a PC laptop, this may become an issue for
PPC Linux users...

Then, the issues with small and large keys. Is there any need for two
sizes? Isn't it hazardous that some peoples' systems may cease to
function because of that? It seems larger keys are far superior...

Any performance issues, anything?

Thanks!

-- 
mjt

