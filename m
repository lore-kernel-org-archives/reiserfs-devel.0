From: David Masover <jedi@ninja.dynup.net>
Subject: Religion and Hard Links (was Re: More on Hard Links)
Date: Tue, 09 Dec 2003 21:22:07 -0600
Message-ID: <3FD6915F.60402@ninja.dynup.net>
References: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Narcoleptic Electron wrote:

>
>- Otherwise, if a file ID for a given volume ID refers
>to a file not identical to the current file (or is not
>found), remove the file from the sync list.
>  
>
    Gah!  What about large files?  What about *gasp* traditional databases?
    Sweet and merciful God, don't let them implement diff in the filesystem!
    That aside, there's the problem of making sure that if a partition 
is unmounted and I change the contents of a file that has a link on that 
partition, the changes should be mirrored, rather than the link severed.

>Well, although the subject line has been changed many
>times, I believe we are still on that thread!  ;-)
>  
>
For good reason!  I feel it is my civic duity to change the subject line 
every now and then!  ;-)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9aRYgisZLIF6uqOAQJ0lQ/+MvX7/6Xe+7etPFRivj3/tnoBS4WohYKc
ze9MYve+iJfJsFQEEwGayNMKumZortcmm59jqmqqyB1yRRDOy3eYhfylTqhzqaZK
RwhvMujm/PID75fQbuY3ofVxDEXbP0/j3axr9h81RTVeWLXCnijeHz3XS5D6qJV5
wZqJHI06/lTKAG+cpJMeGMgMPic2BsnRaavd2434mRjI6AtJNlb0R0tHY5siWlpA
bfOD3unKlxmBXCNsiIWtvPB4gw1DShGja3KwlTeTP27cPwnJrtHPKRpC5SbMCgqT
STWCJiD/C38cqd0RNZ/GEYN/SA/fFFPJZ+tVqS+cFNrn1BoEXUjD/ErsKI6mmY4j
teOTToBBxiLRMSx9xnnqJyo8mcSOZ9m+NOJgHgZuhF6zgzxSK2wEWgOEAvMxSLQj
H6DOdZ4LRfuQQgW2Hbr7WkjhPhfsdAmD/iUZ5CUGNJ3AevBBoCxZNy4MBNLIvjlb
tQXIvUS3cX8tDXLOyowfW3qM7115ueuFBEEt/eX1011qpWLLLpU0WBvzEQJNo3LK
GB7K0Z2uj20t6uOqhfnCbwhyq7YB5DKNH6dQauunR5Jm2L0l0DYUKJfyu1kVIIyt
NCsaZE27E8Dmk3M3lbiuo+W0jO7Thxetj8tBOiYMNsDU+f5SdJxgv21Wol+7i/i5
G2rVG4vrtCQ=
=EsD9
-----END PGP SIGNATURE-----

