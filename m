From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: some basic questions
Date: Wed, 05 Nov 2003 11:47:28 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87d6c6ahjz.fsf@uhoreg.ca>
References: <1067880381.17873.9.camel@redeeman.linux.dk> <1068044839.32072.0.camel@redeeman.linux.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Redeeman" == Redeeman  <redeeman@metanurb.dk> writes:

Redeeman> nobody seems to answer :(
Redeeman> On Mon, 2003-11-03 at 18:26, Redeeman wrote:

[...]

Redeeman> is there anything i should know?

Reiserfs (v3) only does metadata journalling by default.  That means
that the filesystem will always be consistent, but you may still get
data loss.  In order to make sure you don't have any data loss, you
should use Chris Mason's data logging patches[1], and add either
"data=ordered" or "data=logging" to your filesystem options.  (Chris
said that data=ordered would be default eventually, but I'm not sure if
that has happened yet.)

[1] ftp://ftp.suse.com/pub/people/mason/patches/data-logging/

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

