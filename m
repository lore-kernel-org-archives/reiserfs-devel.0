From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Converter program from V3 to V4 ?
Date: Wed, 23 Apr 2003 11:36:52 +0200
Message-ID: <m33ck9wo5n.fsf@merlin.emma.line.org>
References: <50020.61.238.161.206.1051113325.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <50020.61.238.161.206.1051113325.squirrel@sml.dyndns.org> (Thomas
 Graham's message of "Wed, 23 Apr 2003 17:55:25 +0200 (CEST)")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

"Thomas Graham" <lkthomas@sml.dyndns.org> writes:

> reiserfs 4 will be release soon, I got almost 90GB data on a HD that is
> using reiserfs3, how could I install v4 on this HD ? would it have a
> converter program to concert from V3 to V4 ? Thanks.

You should have a backup which you can use to restore your data onto
ReiserFS v4 once that's released. Personally, I'd be chary about going
ReiserFS v4 short after the release. It took ReiserFS v3 a long time
(years) to mature; and although I expect ReiserFS v4 to take not that
long, you shouldn't trust important data to a new file system driver
from the first day. Start with recoverable data first.

-- 
Matthias Andree
