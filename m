From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Reiser4 crypto-compression design
Date: Tue, 25 Mar 2003 22:23:19 +0200
Message-ID: <20030325202319.GT9317@hvs.envisage.co.za>
References: <3E80B384.2190B074@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E80B384.2190B074@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shushkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, Pierre Abbat <phma@webjockey.net>

On Tue, Mar 25, 2003 at 10:52:36PM +0300, Edward Shushkin wrote:
> All
> the compression issues for the traditional approach described in the
> following paper:
 http://www.namesys.com/compression.txt

>   When user creates a crypto-file, the file system asks for a secret
> key and calculates its id (128-bit word) which supposed to be stored
> in file's stat-data on disk.

What about Public-Private key setups?
Ie. using a Public key to encrypt the data (Or at least encrypt the
shared key with the public key). Also, there might/would be the need for
escrow(Right term?) keys. Ie. keys that the Security Officer could use
to decrypt data (In case of bus accident or dismissal etc.)

Or rather, how will the FS "ask"/request a key for decryption in a secure way?

Hendrik
