From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 02:20:36 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87llg1nlu3.fsf@uhoreg.ca>
References: <20040826173227.GB1570@legion.cup.hp.com> <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
 <20040827052804.GD2736@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Jeremy" == Jeremy Allison <jra@samba.org> writes:

Jeremy> On Thu, Aug 26, 2004 at 02:17:04PM -0400, Rik van Riel wrote:
>> On Thu, 26 Aug 2004, Jeremy Allison wrote:
>> > Because without kernel support there is no way someone can publish
>> > a new metadata type and have it automatically supported by all
>> > application data files (ie. most apps ignore it, and only apps that
>> > are aware of it can see it).
>> 
>> So your backup software ignores it, and after a restore you've lost
>> your new metadata ?

Jeremy> Yes, but then you fix your backup software and everyone lives
Jeremy> happily ever after :-)......

Also, once you add support for file-as-dir, you can export any new
metadata that you want through that interface, so backup software will
be able to handle any new stuff you want to throw at it (ACLs, xattrs,
streams, etc.).

If anything, I'd say that needing to fix backup software is an argument
*for* adding file-as-dir semantics: no need to make any more changes
after this one (and it shouldn't be that big of a change, since backup
software already knows how to handle files, and how to handle dirs).

Jeremy> IMHO of course.

ditto.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

