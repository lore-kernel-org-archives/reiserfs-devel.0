From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Some questions about pseudo files
Date: Wed, 9 Jun 2004 23:33:00 +0300
Message-ID: <20040609203300.GS4990@nysv.org>
References: <200406090623.05825.marcel@hilzinger.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406090623.05825.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Wed, Jun 09, 2004 at 06:23:05AM +0200, Marcel Hilzinger wrote:
>
>Is reiser4 designed for keeping the execution bit for each file? If yes, isn't 
>this a security problem (e.g. worms and viruses)?

I think this calls for someone drilling an appropriate hole into VFS
or something. I gathered from some earlier discussions that it's
impossible to do metadata access without the execution bit.

This is not a real issue with some favorite features like crypto and
fibration, but I really want to be able to add arbitrary metadata,
ascii text or xml (big difference there ;) to any old file and that
becomes difficult.

The simplest of kludges would be to store the file's metadata in the
parent directory object's stat data, but that's not the purpose of the
design, imo.

-- 
mjt

