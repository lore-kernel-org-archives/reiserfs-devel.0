From: David Howells <dhowells@redhat.com>
Subject: Re: Key management in Reiser4
Date: Wed, 21 Sep 2005 16:38:51 +0100
Message-ID: <16903.1127317131@warthog.cambridge.redhat.com>
References: <43305F0D.9070407@namesys.com>
Return-path: <reiserfs-list-return-26206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43305F0D.9070407@namesys.com> 
Sender: dhowells@redhat.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, David Howells <dhowells@redhat.com>, Reiserfs List <reiserfs-list@namesys.com>, keyrings@linux-nfs.org


Edward Shishkin <edward@namesys.com> wrote:

> David, would you please review the following:
> 
>                     KEY MANAGEMENT IN REISER4

There's a mailing list for such discussions:

	keyrings@linux-nfs.org

I should update the MAINTAINERS file to reflect this.

> Reiser4 will register its own key type during mount (in accordance with
> the KRS design such registration is possible only in the kernel).

Since the operations may get called a lot, may get called from uninterruptible
contexts and need to handle the construction and destruction of kernel
objects, sticking them in userspace would seem to be a bad idea.

Edward Shishkin <edward@namesys.com> wrote:

> so instantiated
> payload is a pointer to struct reiser4_crypto_stat which contains a pointer to
> the allocated crypto_tfm. The uninstantiated payload should contain the
> following:
>  . actual key;
>  . passphrase (to create/check stat-data keyid);
>  . cipher transform plugin id;
>  . digest transform plugin id;
>  . compression transform plugin id;

You may wish to talk to Michael Halcrow of IBM as he is dealing with
eCryptFS. You may be able to borrow some of his stuff.

> Then user can add a key of registered type and given description to the
> process using add_key() syscall.

That's one way of getting a key into the keyring. The other way is by the
filesystem calling request_key(). There are improvements coming to avoid the
need to call /sbin/request-key if there's an already running service daemon
that can do the key instantiation.

> (payload is a blob of data which represents actual key and maybe something
> else)

The payload blob may be structured internally, and the instantiate and update
operations may take it apart and attach to the key in various places and in
various ways.

> So, as I understand, description is a "name" of a key in the system, that
> can be changed by add_key() syscall.

The description of a key may not be changed, not even by the add_key()
syscall. All add_key() can do is add a new key of a different name or update
the payload of an existing key of the same name.

> create_cryptcompress() looks for a key of some magic description (say
> "default"), then calculates and writes the keyid to disk stat-data.
> (keyid is a 32-bit or greater word created by the actual key and passphrase
> using strong hash).

I presume the "keyid" you mention isn't the struct key serial number.

>   So if you want to create a file ciphered by some key, make sure that this
>   key
> is present in the keyring and currently labeled as "default" (it can be
> provided
> by using add_key() syscall (*).

Are you thinking of getting one struct key per file?

>  (*) Actually it is inconvenient: if there is a lot of keys in the keyring,
>  then
> it would be better to keep a description and mark key as "default" by some
> another way. I found that currently it is possible only for the "keyring" key
> type (The KRS consider keyrings like the keys of this special type). I think
> to
> prepare a patch against KRS to enable default keys of _all_ types (not only
> for
> keyrings). However it requires a linear search per target keyring (currently
> the
> KRS avoids a linear search using additional pointer in task_struct for
> "default"
> keyrings).

What do you mean by default keyrings? The only "default" keyring is the
default target for request_key().

> (**) All we have when trying to open a file is a keyid extracted from disk
> stat-data. However the kernel service request_key() currently implements only
> matching by description. IMHO the last is not enough for the file system: we
> can
> supply different descriptions for the same payload when creating files, so the
> question is what a description should match in a search when opening a file?
> One of the possible solutions is to add a new method (->match_pattern()) in
> the
> struct key_type and a new kernel service request_key_by_pattern():

You don't need to do that. The description is an amorphous blob of text and
the key type is the only thing that matches it against the pattern supplied by
the searcher. You don't have to make the match() method call strcmp() if you
don't want to; you can do something totally wild and different instead if you
wish.

David
