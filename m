From: Edward Shishkin <edward@namesys.com>
Subject: Key management in Reiser4
Date: Tue, 20 Sep 2005 23:12:13 +0400
Message-ID: <43305F0D.9070407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, David Howells <dhowells@redhat.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello everyone.
Any comments are welcome.
David, would you please review the following:

                    KEY MANAGEMENT IN REISER4

I suggest to consider The KRS (Kernel Key Retention Service, (c) Red 
Hat) for
keeping/accessing the keys. The KRS includes a number of syscalls and kernel
services described in linux/Documentation/keys.txt. It seems quite universal
and contains almost all we need. Also we can make the keys to be 
persistent in
flush time by managing extra-references.

                    Registering the key type

 Reiser4 will register its own key type during mount (in accordance with
the KRS design such registration is possible only in the kernel). I will not
provide all details, just note, that ->instantiate() method of reiser4 
key_type
calls linux crypto-api and allocates a struct crypto_tfm, so instantiated
payload is a pointer to struct reiser4_crypto_stat which contains a 
pointer to
the allocated crypto_tfm. The uninstantiated payload should contain the
following:
 . actual key;
 . passphrase (to create/check stat-data keyid);
 . cipher transform plugin id;
 . digest transform plugin id;
 . compression transform plugin id;

 Then user can add a key of registered type and given description to the 
process
using add_key() syscall. The description is used for matching key in a 
search
and can be observed in procfs with other attributes. If the key of this
description already exists, then add_key() will try to update it with given
payload (payload is a blob of data which represents actual key and maybe
something else). So, as I understand, description is a "name" of a key 
in the
system, that can be changed by add_key() syscall.

                    Creating a cryptcompress file

  We will add a new mount option so reiser4_create() first will check 
for the
keys of registered reiser4-specific type in the target keyring if this 
option
is on. If such keys are present, then cryptcompress regular file will be
created. If no, then the file plugin will be inherited from parent (unix 
file
by default). If the number of attached keys (of all types) is small, this
operation will not be expensive).
create_cryptcompress() looks for a key of some magic description (say
"default"), then calculates and writes the keyid to disk stat-data.
(keyid is a 32-bit or greater word created by the actual key and passphrase
using strong hash).
  So if you want to create a file ciphered by some key, make sure that 
this key
is present in the keyring and currently labeled as "default" (it can be 
provided
by using add_key() syscall (*).

                    Opening a cryptcompress file

The ->open() method of cryptcompress plugin looks for a key in the target
keyring by stat-data keyid (**), checks its validness (by validate_key()
kernel service of KRS), then increments a reference counter and adds the 
pointer
to reiser4 part of inode (if it is absent). The ->destroy_inode() method of
cryptcompress plugin decrements the reference counter and releases
reiser4-specific payload (if the counter became zero). So even in the 
case when
the key became invalid, it can not be evicted, and flush algorithm can 
use it
for ciphering, while it is impossible say to open files with this key.


____________________
 
(*) Actually it is inconvenient: if there is a lot of keys in the 
keyring, then
it would be better to keep a description and mark key as "default" by some
another way. I found that currently it is possible only for the 
"keyring" key
type (The KRS consider keyrings like the keys of this special type). I 
think to
prepare a patch against KRS to enable default keys of _all_ types (not 
only for
keyrings). However it requires a linear search per target keyring 
(currently the
KRS avoids a linear search using additional pointer in task_struct for 
"default"
keyrings).

(**) All we have when trying to open a file is a keyid extracted from disk
stat-data. However the kernel service request_key() currently implements 
only
matching by description. IMHO the last is not enough for the file 
system: we can
supply different descriptions for the same payload when creating files, 
so the
question is what a description should match in a search when opening a file?
One of the possible solutions is to add a new method (->match_pattern()) 
in the
struct key_type and a new kernel service request_key_by_pattern():

int (*match_pattern)(const struct key *key,
                     const void *pattern);

This method is to match the @pattern with another one constructed by the 
payload
of the @key.

struct key *request_key_by_pattern(const struct key_type *type,
                                   const void *pattern);

This kernel service is to request a key with a pattern that matches the
pattern specified according to the key type's ->match_pattern() function
(matching by stat-data keyid in the case of reiser4).

So our needs within the KRS are the following:
1. ->match_pattern() method in struct key_type;
2.  request_key_by_pattern() kernel service;
3. a pair of new keyctls to set/get default key of _any_ types;
4. a kernel service to get default key of _any_ types.

If there is no objections, I will prepare a patch for the features above.


Thanks,
Edward.

