From: "Artem B. Bityuckiy" <dedekind@oktetlabs.ru>
Subject: ReiserFS on large-scale flash
Date: Wed, 25 May 2005 21:22:04 +0400
Message-ID: <4294B43C.2070200@oktetlabs.ru>
References: <42947589.2020707@hyves.nl> <4294783C.5040001@darthvader.us> <42947BCA.9080702@hyves.nl> <42949FDF.8000406@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42949FDF.8000406@darthvader.us>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I'm designing new flash file system. And I'm thinking about the 
possibility to write plugins for ReiserFS to implement it (I know, it 
sounds crazy). I didn't thoroughly explore is it possible or not yet.

I'm almost certain that it is impossible to do this with the current 
Reiser4 and more changes are needed. Flash devices just has another 
model, not the same as block devices. In a nutshell, you can't write 
twice to the same block (out-of-place writing property) and you must 
erase a several consecutive blocks before re-using any block (read here: 
http://en.wikipedia.org/wiki/Flash_memory).

Currently there are no Flash file systems which are usable on large 
scale flashes, at least in Linux. And there is a real need in such FS.

So, I'd like to know, are Reisre4 developers interested in this? Will I 
have some assistance from them if I find some Reiser4 limitation? Is it 
worth starting exploring Reiser4 or better just start new FS?

Thanks.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
