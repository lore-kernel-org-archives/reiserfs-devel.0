From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: secure delete?
Date: Fri, 19 Mar 2004 11:04:01 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87u10k4ydq.fsf@uhoreg.ca>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk> <405AD31A.7070304@mweb.co.za>
 <20040319110748.GA30491@chihiro.cern.ch> <405AD9B5.80102@namesys.com>
 <1079697068.5812.13.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Peter" == Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> writes:

Peter> On Fri, 2004-03-19 at 11:29, Hans Reiser wrote:
>> Encrypt everything is what will work best.

Peter> I guess you would have to use an encrypted swap area as well,
Peter> right?  Would the performance be ok for that? Peter

If you have any sensitive information, then encrypted swap is a good
idea.  I'm using encrypted swap, and I'm not experiencing any noticeable
performance hits.  But I have sufficient RAM (374MB) so it doesn't swap
often.  If your machine swaps a lot, I would assume that performance
would be bad (but it's probably already bad if you swap a lot).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

