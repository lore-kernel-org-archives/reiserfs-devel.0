From: David Masover <jedi@ninja.dynup.net>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes
 too Far))
Date: Fri, 05 Dec 2003 19:54:26 -0600
Message-ID: <3FD136D2.4070808@ninja.dynup.net>
References: <36084356861-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <36084356861-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


>Incidentally, renaming files is a superset of the delete operation.
>Implement that first, and you have delete for free.
>  
>
If only it was that easy.  When you rename a folder, you don't usually 
do a recursive rename of everything inside.  When you delete a folder -- 
you don't, unless it's "rmdir".  You recursively delete each file 
inside, and it's that kind of operation that creates problems for hard 
links to directories.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9E20wisZLIF6uqOAQIgfQ/7BxHQKiew/8jCIlo7lKKLHBxBS1mnZBLH
rNaJFnqZLCHJOsPSphx2YcVxRq4IhSCK4lKdT5IMzbwwY9nQOyp7ans8IgzTLMbh
edryWJXWjOPI4Q6ZS9j7mPnDa5452CBc5/ioMJIuuqScH/MMoeK5hWOqED/snzl/
NzjIvxWgaXv8FWZsN/0WG/GPFwlp0KdaM2uPZSfozMZ8r/j4lc5kYsYhL/frDKH8
kkU6I6AvEQTsdAT+NP+idfwYFMkYelfd8y0jkLzq3kN+XiogC7fdaC0U+biKTxpg
rSfs608okneLNGPe0zunmBD/xuZAEbvf6d+ILML4F7VBpG+4j5Wt/KAneJJyCM3H
QQggG4O36pPeHOHvjJ446njjTYq1KBBO5oZdJvmWp5vUiQW+zA88uHUsn7KjTKkY
5/czmukczBIK7wcYjHPKGUsOLUmWKp331eybeOMTM6UsMiWORfQwKsQitKG+pkFf
j01ClbPUICH6tRhZ08JJZsO11hsAIjDaWVib2a+fHBuiXpEgoKaLIuqrxHfgJaUr
1PUlcKn8G9RNYXZkO+ZH7bts9WhkGcukFLMotiuRrLY+W70QhnA/DLay0siadhu9
3DTiRWCx2+y8MswlKyMa1N9hYI0EPtPqNIAnbtl9cG+Cx/PiIWoN1lzZDr6NJ0P6
GotO6gSuOMQ=
=7FN9
-----END PGP SIGNATURE-----

