From: David Masover <jedi@ninja.dynup.net>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes
 too Far))
Date: Sat, 06 Dec 2003 19:08:51 -0600
Message-ID: <3FD27DA3.7030309@ninja.dynup.net>
References: <1569161060-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1569161060-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:

>David Masover wrote on Fri, 05 Dec 2003 19:54:26 -0600:
>  
>
>>>Incidentally, renaming files is a superset of the delete operation.
>>>Implement that first, and you have delete for free.
>>> 
>>>
>>>      
>>>
>>If only it was that easy.  When you rename a folder, you don't usually 
>>do a recursive rename of everything inside.  When you delete a folder -- 
>>you don't, unless it's "rmdir".  You recursively delete each file 
>>inside, and it's that kind of operation that creates problems for hard 
>>links to directories.
>>    
>>
>
>Actually, renaming also is recursive.  The obvious case is when you
>rename a file over an existing file (or directory), which implies the
>whole deletion mechanism is needed.
>  
>
Most of the time, rename over an existing file needs only a single 
deletion, and renaming over a directory is (last I checked) impossible 
with standard tools without removing or renaming the directory first.  
If I do
touch a
mkdir b
mv a b
It will move 'a' to a file inside of 'b', rather than removing 'b'.  
This isn't necessarily the best way, but it's how it's done now -- to 
get the effect you're implying, I'd have to do
rm -rf b
mv a b

>Also, at least for the AGMS link mechanism (or perhaps for any system
>that allows multiple parent directories), it has to do a graph traversal
>to find out which parent links are still valid, and which need to be
>adjusted if their parent has been changed.  If you see the example at
>the bottom of http://web.ncf.ca/au829/BeOS/AGMSLinkExplanation.txt you'll
>notice that deleting something can cause a sweeping re-evaluation of who
>is the parent to what.  The same thing would happen if you rename (move)
>a parent directory to be a subdirectory of one of its children.
>
>  
>
Can we do that?  Last I checked, the file utilities (or maybe the fs 
itself) won't let you move a directory to a child of itself, or a child 
of a child of itself.  If this "graph traversal" is what I think it is, 
it belongs in fsck, not normal fs operation.  Of course, I don't have a 
better solution, aside from either stretching the limits of reference 
counts or dropping directory hardlinks altogether.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9J9pwisZLIF6uqOAQKZhxAAnMQNtl9MMwVNNhbDKIBpT9PDKqwb1b0C
NfrgOBMyxlosTWT0OVrbS5deFoTefkpk6inzlcck9nCLDCB5CnOfKBlnA1MbWaPN
jHsmC5Cz0mVOk61hWUvWDWZ1DLrl4yb313KF/5XwTGyQ/0NZWTHEAgHf4FjX3wRq
ZkLubWGt7fdsRv+FWo1s5ah2sQPzPj/3nynECFVt1gQaGoNkaxETWj3a5bAjLWwX
9SZLDrhqPxPzKCFvs9OL9PH2MC7nlYa0rOEOKdKBdTsTMdEhEluZyTXVYAMmwlpM
d3UQj6tcg5ehRs7jHhsjKSD4nIzdmK8nKrBXi0j+anw/g8n+bHFbgsVCOwumv8WO
k1AxnGncgcdtkNSafUmNGYgtL5Ra0Fv0b2sIjggyHmZFes5OBr3Kgj93Mznk1z10
siiVA43NhBimHuZsdyZ1U64Sl5uV287iAgKqDPbvQ4Z24uV6X0b5/4vpRcDsm++U
05M1c/CwG9YLqVluzm0ewvq8px0zGrcPbkm6v86PL9UxIbN8aDKKqyaUv8lXHi7y
YiWwFingzlUIkyXV2yfdzRbXthdhXo17gX0NJBaiyS9jYl40DecuFH5w3bFxLhnj
ys9IOrM0Q2hSTzyD2GFyR8FoJQIypc95YwkeOBZbUjskyJy7xE2bX+269US9ursz
BA6EToDsPwg=
=aMts
-----END PGP SIGNATURE-----

