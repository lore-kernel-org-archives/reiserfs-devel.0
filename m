From: David Masover <ninja@slaphack.com>
Subject: Re: Recursive mtime implementation questions
Date: Thu, 13 Jan 2005 17:56:26 -0600
Message-ID: <41E70AAA.2070304@slaphack.com>
References: <200501111307.56368.namesys.sch@ttgen.net> <200501111854.49379.namesys.sch@ttgen.net> <41E67487.2030003@namesys.com> <200501131618.02318.namesys.sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501131618.02318.namesys.sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <namesys.sch@ttgen.net>
Cc: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Fred Schaettgen wrote:
| On Thursday 13 January 2005 14:15, you wrote:
|
|>Fred Schaettgen wrote:
|
| ...
| ..
|
|>>>There is a union (file_plugin_data) in struct reiser4_inode to keep
|>>>features specific
|>>>for file plugins.
|>>
|>>I can't use that union, since my plugin would call the methods of the
|>>original file plugin of a file,
|>
|>Let's first specify the notification interface. Should it be kernel
|>messages, or
|>should the fs write something to /proc? (I don't have ideas)
|
|
| Actually I didn't think about active notification at all. The idea is
to set
| an timestamp for each monitored file, which is reset for the file
itself and
| the whole path(s) upwards when the file is changed.
| A userspace program which manages an index will find the newly changed
files
| by looking at that timestamp in some base directory and descending
into each
| subdirectory for which this timestamp is more recent than a saved
timestamp
| or if the timestamp isn't set at all. On the way back, the missing
timestamps
| will be updated.
| So it's by design a single-shot "notification" and you would have to
poll a
| single file to be able to update your stored data continously. This
should be
| adequate for applications which index large parts of the file system. For
| other needs, inotify will be the better solution.

Can't we use inotify on that single file, or even its own attribute (as
a meta-file) that we'd otherwise have to poll?  Sorry to nitpick, I just
want to be very clear at this stage.

| The pseudo-file interface could look like this:
| file/..../watch/m_timestamp [r]
| dir/..../watch/m_watch_file [w]
|
| m_timestamp is set for a file, when its name is written into the
| m_watch_file-attribute of one of it's parent directories.
| This will also add a link to the file back to the directory, so that
when the
| file is changed, the timestamp of both the file and the directory (and
so on)
| are reset.
| That's quite expensive, but it will happen only once per file, until the
| timestamp for a file was set again by a crawler.

And what's more, you often wouldn't have to travel farther up the tree
than the parent directory, if that parent is common to a lot of changing
files.

|>>so file_plugin_data is occupied already. I'm not sure
|>>if adding another field outside that union would make reiser4 perform any
|>>worse, but I was just hoping that this plugin can be implemented without
|>>any overhead at all as long as it is not used. A new feature is much more
|>>easily accepted if it doesn't affect you if you don't use it.
|>
|>This is why you need a new object plugin with its own methods.
|
|
| Ok, so creating a new file type called "watched_file" seems really the
right
| way.
| This still leaves the problem where to save per-inode data for this
plugin
| without having to increase the size of a reiser4_inode in general. I
don't
| care much, so before anyone else complains, I'll stop thinking about it ;)

The trick is converting normal files to watched_files.

- -----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQecKfHgHNmZLgCUhAQLLnxAAlgKzroTX0MTy/VVOLKr+4l+34/2g32AB
Rg9+kQWIeVpGfzyLpSy0DhO/0Mt01/9zDkvgYRGwgGhfw496BFPtkF/YvmlcFPbs
Txm5x/HiYjHinb5xah/Eq3lkTov/Y4eEyXvPJWk74MOS3MF/NAB8zuQ6ZLKf5LDT
w3eVxdMA/ubbpL6JmcCImeueJEdZ8ZXf+oI3AsQVmPW4gbaIZkCXxUem574BoVQc
tT6F7S9dmETw6M+VlSj0txWWE8iVwJ43QKErUSIpGgXVxSvE6pB97HrgD0oAwBrz
G1v+6ODRaW20zYdAbxH619Moq8KsubucWcwxSsHCK5mGSrwFqK1ry0w6CqxCXgxT
OiyNzPlW2WWZumRqmpI250EyS7JP7jdI+/xQFTB7OMr+9Pbveplrxm7BvRNwVKjB
y1G8F/hUDGaL0Rfb8ogG9tLMeNrVUpOOJ9gWBqnw7WglTxDUgmanNADzK1gEt1/E
HHh3tJDqFV0JR+zb+MhZt2OLJ9goGDEAva4Ckc8IGahkya13W/lj2eAP4c5jdi3O
OHW1UvHq4qBOlQyUQzHTjZVJqkb66e8OWUwb7+BTrXcbagNgOameDVhipEjZMn4+
LdrGjySWu4YFX/u4JAiyP0G1daiAqZ7bQ5amBh3JE0K0auRiConI0//iDwdXq+4e
O8piUEsBnQ8=
=Yb7h
- -----END PGP SIGNATURE-----
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQecKqXgHNmZLgCUhAQKxHQ/9Fb7IPLnqcHuhNK01djVpDLfc/7L7TRVG
4dU7cG27VDGrqbRjXOIdtjwBSxcKO0+pQHcGccMpd7+gNu6Z+xVzcivj0qBBhrcY
wIU4lPM6r2Izbj73b5qEOAh/UtX1+cfyJ5gihDl69sIlePZF0lgmYhTxvz9L24Sx
QFvw76Ei1UvSncP7QIkn9znZiPUTTi57Xs9u5vX5HI9tVQWQgvPxwbOeN4T25RC/
IY6kd507oGgz3kRKcd5ji3UDXcgFcdvaFWn7gWd3uGSqK44KujX5D3NDNs3P18JM
9D0xGUyUgd/Nuxokb+qmGTmAVTaUYOoWSMOUYFpt3mlwDgZZ5+dH4pIA2cH3qCpe
uQZVi3n7fPPpE+Q9BrgaPn+vmkZ9yoqEt5Zzlp58AtlXmtNnmuBOYH7BO3iXyz8U
wGPLNAsFpTByA1p08QVRyuBkzCG9jw1a7dlwpMrsoaOH7k/2Yw/vhW1B/CgyUnAP
aQCRYIGkekUc6XSM0uhaCDyF3wMTsn0Ec1aI9ZzObfA0IOh0is9vzBc6cXRAvHcs
sbY0DBVD7vhLNwvEfrN6JYKrvxdfJ+n89Gkd6rn2Jtc7n2m3Fllq3S2Cx+ch87L6
xfRYZGM79HOJB5C7a2HZT4vNWNDsdfXAn3gffsFSSHq558Srz8K27Or3MRCf9Ec5
tI201Z6LZo4=
=f3Th
-----END PGP SIGNATURE-----
