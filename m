From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Sat, 25 Jun 2005 20:24:57 -0400
Message-ID: <87fyv6ezhi.fsf@evinrude.uhoreg.ca>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	<42BCD93B.7030608@slaphack.com>
	<200506251420.j5PEKce4006891@turing-police.cc.vt.edu>
	<42BDA377.6070303@slaphack.com>
	<200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> (Valdis
 Kletnieks's message of "Sat, 25 Jun 2005 16:31:37 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Sat, 25 Jun 2005 16:31:37 -0400, Valdis.Kletnieks@vt.edu said:

[...]

> Meanwhile, PGP was designed to be used in an environment where you
> could do this: "Today's secret plans are AES256 encrypted.  The key is
> the next key in your one-time-pad book, XOR'ed with your 128-bit
> secret key - do it in your head".  (And yes, you can easily memorize a
> 16-digit hex number and learn to do an XOR with another 16-digit
> number, if failing to do so means you could end up dead).

Huh?  I have no idea what this has to do with PGP vs. encryption being
handled by the filesystem/loopback/dm-crypt.  What's the difference
between that scenario and "Today's secret plans are stored in the
loopback file foo.iso on an AES256 encrypted ISO.  The key is ... "?

Or "Today's secret plans are stored AES256 encrypted in foo.txt.  To
access it, you'll need to do {magic command to enter the key into the
filesystem} [1].  The key is ..."?

[1] I have no idea what kind of interface the crypto plugin in Reiser4
will have.  I'm assuming that there will be some commands for adding and
removing keys from the plugin.  If such commands don't exist, then we
have a seriously broken system.

> This is inconvenient for the user, but intractable for an attacker to
> create a scenario where they can just 'vi /each/decrypted/file' ;)

If you can memorize a 16-digit hex number and do XOR in your head, you
can learn to unmount the loopback/remove the key from the filesystem
too.

Which is definitely easier than remembering to create a temporary RAMFS,
mount it (with the right permissions!), decrypt the secret plans to that
FS, edit the plans, re-encrypt the plans, blow away the RAMFS...

>> won't do it.  If security is transparent, just enter a password and
>> go, then more people would do it.

> "Just enter a password and go, then more people would do it".

> Two words: "phishing e-mail".

Social engineering works in meatspace too.  Most people have locks on
their doors, even though they're easy to get around if you can pretend
to be from the electrical/gas/water company.  But having locks on your
doors is better than not having locks, because it prevents other types
of attacks.

I don't care if phishing gets around encryption.  It would work the same
if people didn't have their stuff encrypted.  But users with encrypted
stuff are safer from other types of attacks, and no less safe from
phishing.

I'd rather have people encrypting all their stuff and still be
vulnerable to phishing but secure from someone stealing their computer
and fetching all their personal data, than having people not encrypt
their stuff and have all their personal data harvested when they lose
their computers and still be vulnerable to phishing.

P.S.  Is the custom on the linux-kernel list really to Cc: everyone and
their dog?  I'm seeing a lot of long Cc: lists here...

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

