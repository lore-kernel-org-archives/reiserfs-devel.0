From: David Masover <jedi@ninja.dynup.net>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Fri, 05 Dec 2003 19:38:27 -0600
Message-ID: <3FD13313.9010506@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87zne7xltp.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hubert Chan wrote:

>>>>>>"David" == David Masover <jedi@ninja.dynup.net> writes:
>>>>>>            
>>>>>>
>
>[...]
>
>David> Now, why would I use separate filesystems in the first place?
>David> Two reasons: performance and security.  Right now, it's a lot
>David> easier to have /var be a certain sized partition rather than
>David> trying to enforce disk quotas. ...
>
>There's more to security and good administration than just disk quotas.
>You can have different partitions mounted read-only.[1] You have
>  
>
And how is that different than chmod -x?  Root can remount a partition 
writable just as easily as chmod'ing a file, unless the partition is 
something like iso9660.

>different mount attributes such as nodev, nosuid, noexec.  You may even
>want to take advantage of the fact that you can't hardlink across
>partitions (you don't want users to be able to hardlink programs from
>/usr/bin).  Separate partitions also allows you to easily reinstall by
>  
>
Why not?  (Naive question -- I can't see any problem here.)

>blowing away your root partition (after copying your /etc), e.g. if
>your system gets compromised.  And so forth.
>  
>
There are many ways of doing this, including:  copy to a network server, 
make a temporary partition (after resizing the main one), burning a CD, etc.

>[1] This presents another problem to hardlinking across partitions.
>What if you try to hardlink a file from a read-only partition onto a
>read-write partition (or vice versa)?  A hardlink is supposed to be
>  
>
I argued not for hardlinking across partitions, but for improving 
flexibility and raw speed to where none of the usual reasons for having 
multiple partitions (or for hardlinking across partitions) matters.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9EzFQisZLIF6uqOAQLvfRAAmzFz71o9ur9nfysFutnEoEY1sD5s8KQh
Jyc1BqK2skLKs5RNZJbKJ3AsGnkdZ/ABR265k99Bt/CKkM+KuNy8gqsG6Y6qwNFA
gWYbeXgkhm0ql9ih0VQ/+exm9AhLL2/DzgEf6ND7yYCFxnfxqmH6uGAQxq64yIU+
G64+JtoIbALODSv4a29VPDIjXfgEr5YZFFIDjw0tMX/KV98n419CVJUfg9qeIWN8
Oi2XJQzXVyOXx9kt2YxXVOPqLUh5Vody6GC5vckO5CNut6G4FdolW8V6NkJo8A3t
Yeg995M1v4B4h6a4HjH/OrYOllAB7zmyMw5v4gZI0MSmChLwpLnwXuxPsyaLcOJy
PVFtZMrHgk/fmH3Ur0HxaJxofiToZOOsh+Bc9vGcKQek8B/+zzeakEu+L6hwYdsq
FCC1BryKz7guRBgXexr1DCalYH7w+NrZsELUYt6ocrBuB48dJMSVoqcLcW4DPgHD
fZZozuWDT2Psnn8NGlGhQFs/CapSyMwaWjcUtFxKrRu8hc1ZfXS18tUoFtlVLctP
1NQ43MhQ8VME0Rg6k54CXNjq7boi2Zn3pvtupWIN+ZE5ZmzCZTVP97Yz0X25cBYF
YquetvWZLQrsI6nFSZYrLmUe7IsMgNuJa7CZZdxhPrl0Zpnx+2Y6RGnHMYEsvolv
cEDSKfEpdmY=
=n7JO
-----END PGP SIGNATURE-----

