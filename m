From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 14:35:09 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87isazma02.fsf@uhoreg.ca>
References: <41323AD8.7040103@namesys.com> <413486B0.4050101@sun.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

>>>>> "Mike" == Mike Waychison <Michael.Waychison@Sun.COM> writes:

Mike> Hans Reiser wrote:
>>
> Why Openat Sucks:
>> 
>> because you can't go cat filenameA/metas/permissions >
>> filenameB/permissions
>> 
>> If cat doesn't work, then we are suffering exactly the problem with
>> namespace fragmentation that this whole scheme was invented to avoid.

Mike> Sure you can.  All you need to do is fix your shell.

And you'll have to fix every other program that you want to use to edit
metadata/attributes/streams.

The whole point of avoiding namespace fragmentation is to avoid having
to fix programs.

Like I said in another post, the world is bigger than just the command
line.  The command line just gives really easy examples of why Hans (and
others) thinks about things the way he does.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

