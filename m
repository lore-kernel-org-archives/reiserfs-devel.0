From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 23:42:26 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <874qmhbal9.fsf@uhoreg.ca>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a>
 <20040831081528.GA14371@thundrix.ch>
 <20040901201608.GD31934@mail.shareable.org>
 <1094070506.28509.24.camel@shaggy.austin.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Dave" == Dave Kleikamp <shaggy@austin.ibm.com> writes:

Dave> On Wed, 2004-09-01 at 15:16, Jamie Lokier wrote:
>> (For example, if I edit an HTML file which is encoded in iso-8859-1,
>> change it to utf-8 and indicate that in a META element, and save it
>> under the same name, the full content-type should change from
>> "text/html; charset=iso-8859-1" to "text/html; charset=utf-8".)
>> 
>> I don't see how you can do that without kernel support.

Dave> Your html editor should do that.

And if it doesn't, you'll need to patch your editor.  Every editor will
need to be patched to make sure that it is always consistent.  Even
sed.  And you'll have to do that for every dynamically-changing
attribute that people want.  Sure, you can go that route if you want,
but I wish you luck.  You'll need it.

(Just for the record, I don't particularly think that the example given
by Jamie is a good one.  The "meta" element to me is a hack necessitated
by not being able to attach attributes to a file in a consistent manner.
The "proper" way to do it would be to set the content-type as an
attribute, and let the webserver read that and send it in the HTTP
header, where it's supposed to be.

Another example could be thumbnails.  There are probably more, but I'm
not feeling very creative right now.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

