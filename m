From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: assembling a file out of debugreiserfs's map
Date: Fri, 28 May 2004 12:55:33 -0400
Message-ID: <20040528165533.GA12618%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=windows-1251
Content-Disposition: inline


Thanks to Vladimir, I run debugreiserfs -n with the name of the missing
jpeg, p5270916.jpg, and found some data, creating a map.  As Vladimir
described, the map charts metadata and the data proper blocks.  I attach
the -f output.  Since the idea to get the blocks back is to do dd on each,
I wonder why do I have just a few blocks back, although the file size is
correctly shown in metadata as 3563604.  The -n run said, found 14 items.

To compare, the file which was recovered by rebuild-sb/rebuild-tree
is the other jpeg, named p5270917.jpg.  It was automatically placed in
lost+found.  I did a run of debugreiserfs -n to get its map, too.  The -n
run said, found 4 items.  I attach the -f output as well.  That shows
just two block numbers!  But the file was recovered automatically, with
the correct size, 3428007.  Do these block numbers imply ranges/chaining?

Just to recap, the first, long output, is for p5270916.jpg, which I need
to manually assemble.  The second, short output is for p5270917.jpg,
which was recovered automatically.

I also attach Vladimir's explanations on running -n/-f, and dd'ing.
The questions remaining are (1) where are all the blocks, i.e. why
does the output shows so few, (2) is the order of the output correct,
i.e. assembly should just go sequentially, (3) what size bs to give dd,
probably related to the number of blocks.  Feelin' almost there!  :)

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset="windows-1251"
Content-Disposition: attachment; filename="vs.1"
Content-Transfer-Encoding: base64

U3ViamVjdDogUmU6IGRkL3JlYnVpbGQgb2YgYSBzbWFsbCB1c2VkIHBhcnQgb2YgYSBodWdlIHJl
aXNlcmZzIG9uIGx2bT8KRnJvbTogVmxhZGltaXIgU2F2ZWxpZXYgPHZzQG5hbWVzeXMuY29tPgpU
bzogQWxleHkgS2hyYWJyb3YgPGxpc3QrcmVpc2VyZnNAc2V0dXAub3JnPgpDYzogVml0YWx5IEZl
cnRtYW4gPHZpdGFseUBuYW1lc3lzLmNvbT4KCkhlbGxvCgpPbiBGcmksIDIwMDQtMDUtMjggYXQg
MTE6MjksIEFsZXh5IEtocmFicm92IHdyb3RlOgo+IEp1c3QgdG8gYWRkLCB0aGUgZmlsZSBuYW1l
IGluIGxvc3QrZm91bmQgd2FzIDI1NzJfMjU3NC4gIFRoZXJlIHdlcmUKPiB0d28gbGFyZ2UganBl
Z3MsIGFib3V0IDQgTUIgZWFjaCwgYW5kIHRoZSByZWNvdmVyZWQgd2FzIG9uZSBvZiB0aGVtLgo+
IFRoZXkgd2VyZSB3cml0dGVuIG9uZSBhZnRlciBhbm90aGVyLiAgQ2FuIEkgZG8gc29tZXRoaW5n
IGJhc2VkIG9uIHRoZSBmaWxlCj4gbmFtZSwgaWYgaXQgcmVwcmVzZW50cyBzb21lIGJsb2NrIG51
bWJlcnMgcmFuZ2Ugb3Igc29tZXRoaW5nIGFuYWxvZ291cz8KPiBBbHNvLCBJIGtub3cgdGhlIG5h
bWVzIG9mIHRoZSB0d28gb3JpZ2luYWwganBlZyBmaWxlcy4gIENhbiB0aGF0IGhlbHA/Cj4gSnVz
dCBjdXJpb3VzLi4uCgp5ZXMKdGhlcmUgaXMgYSB3YXkgdG8gZmluZCB3aGljaCBibG9ja3MgZmls
ZSBpcyBidWlsdCBvZgpkZWJ1Z3JlaXNlcmZzIC1uIGZpbGUtdG8tbG9vay1mb3IgLWEgZmlsZS5t
YXAgL2Rldi9oZGExCgp0aGlzIHdpbGwgc2NhbiByZWlzZXJmcyBtZXRhIGJsb2NrcyBhbmQgdHJ5
IHRvIGZpbmQgbWV0YWRhdGEgb2YgZmlsZXMKd2l0aCB0aGlzIG5hbWUKCm1ldGFkYXRhIHdpbGwg
YmUgc3RvcmVkIGluIGZpbGUubWFwLjEKCmRlYnVncmVpc2VyZnMgLWYgLWEgZmlsZS5tYXAuMSAv
ZGV2L2hkYTEKd2lsbCBwcmludCBpbmZvcm1hdGlvbiBmb3VuZAoKYW4gZXhhbXBsZToKIyMjIGlz
IHVzZWQgZm9yIGNvbW1lbnRzIGkgYWRkZWQgdG8gb3V0cHV0IG9mIGRlYnVncmVpc2VyZnMgLWYK
CnRyaWJlc21hbjovdG1wL3JlaXNlcmZzcHJvZ3MtMy42LjE0L2RlYnVncmVpc2VyZnMgIyAuL2Rl
YnVncmVpc2VyZnMgLWYKL2Rldi9oZGI3IC1hIGZpbGUubWFwLjEKZGVidWdyZWlzZXJmcyAzLjYu
MTQgKDIwMDMgd3d3Lm5hbWVzeXMuY29tKQoKYmxvY2sgNzgsIGl0ZW0gMDogNSAxNCAweDAgU0Qg
KDApLCBsZW4gNDQsIGxvY2F0aW9uIDI2NDAgZW50cnkgY291bnQKNjU1MzUsIGZzY2sgbmVlZCAw
LCBmb3JtYXQgbmV3CihORVcgU0QpLCBtb2RlIC1ydy1yLS1yLS0sIHNpemUgMzM3ODQsIG5saW5r
IDEsIG10aW1lIDEyLzIwMDIgMTk6Mjg6MzUKYmxvY2tzIDcyLCB1aWQgNTEyCgojIyMgc3RhdCBk
YXRhLCBmb3VuZCBpbiBibG9jayA3OCwgdGhpcyBpcyBibG9jayBvZiBqb3VybmFsCgpibG9jayA4
OCwgaXRlbSAwOiA1IDE0IDB4MCBTRCAoMCksIGxlbiA0NCwgbG9jYXRpb24gMjY0MCBlbnRyeSBj
b3VudAo2NTUzNSwgZnNjayBuZWVkIDAsIGZvcm1hdCBuZXcKKE5FVyBTRCksIG1vZGUgLXJ3LXIt
LXItLSwgc2l6ZSAzMzc4NCwgbmxpbmsgMSwgbXRpbWUgMTIvMjAwMiAxOToyODozNQpibG9ja3Mg
NzIsIHVpZCA1MTIKCiMjIyBvbmUgbW9yZSBjb3B5IG9mIGZpbGUgc3RhdCBkYXRhIGluIGpvdXJu
YWwKCmJsb2NrIDk4NTAsIGl0ZW0gMDogNSAxNCAweDAgU0QgKDApLCBsZW4gNDQsIGxvY2F0aW9u
IDI2NDAgZW50cnkgY291bnQKNjU1MzUsIGZzY2sgbmVlZCAwLCBmb3JtYXQgbmV3CihORVcgU0Qp
LCBtb2RlIC1ydy1yLS1yLS0sIHNpemUgMzM3ODQsIG5saW5rIDEsIG10aW1lIDEyLzIwMDIgMTk6
Mjg6MzUKYmxvY2tzIDcyLCB1aWQgNTEyCgojIyMgc3RhdCBkYXRhIG9mIGZpbGUKCmJsb2NrIDc4
LCBpdGVtIDA6IDUgMTQgMHgxIElORCAoMSksIGxlbiAzNiwgbG9jYXRpb24gMjYwNCBlbnRyeSBj
b3VudCAwLApmc2NrIG5lZWQgMCwgZm9ybWF0IG5ldwo5IHBvaW50ZXJzClsgMTAxNzEoOSldCgoj
IyMgcmVjb3JkIGZyb20gam91cm5hbAoKYmxvY2sgODgsIGl0ZW0gMDogNSAxNCAweDEgSU5EICgx
KSwgbGVuIDM2LCBsb2NhdGlvbiAyNjA0IGVudHJ5IGNvdW50IDAsCmZzY2sgbmVlZCAwLCBmb3Jt
YXQgbmV3CjkgcG9pbnRlcnMKWyAxMDE3MSg5KV0KCiMjIyByZWNvcmQgZnJvbSBqb3VybmFsCgpi
bG9jayA5ODUwLCBpdGVtIDA6IDUgMTQgMHgxIElORCAoMSksIGxlbiAzNiwgbG9jYXRpb24gMjYw
NCBlbnRyeSBjb3VudAowLCBmc2NrIG5lZWQgMCwgZm9ybWF0IG5ldwojIyMgdGhpcyBpcyBzby1j
YWxsZWQgaW5kaXJlY3QgaXRlbS4gSXQgY29udGFpbnMgbnVtYmVyIG9mIGJsb2NrcyBmaWxlCmNv
bnRlbnQgaXMgc3RvcmVkIGF0LiA1IGlzIG9iamVjdGlkIG9mIGRpcmVjdG9yeSB3aGVyZSBmaWxl
IHdhcyBjcmVhdGVkLAoxNCBvYmplY3RpZCBvZiBmaWxlIGl0c2VsZiwgMHgxIC0gb2Zmc2V0IHdp
dGhpbiB0aGUgZmlsZSAoMSBhZGRyZXNzZXMKMC10aCBwb3NzaXRpb24gaW4gYSBmaWxlKSAKOSBw
b2ludGVycwpbIDEwMTcxKDkpXQoKIyMjIHRha2UgbGlzdCBvZiBmaWxlIGJsb2NrcyBmcm9tIGhl
cmU6CiMjIyAxMDE3MSwgMTAxNzIsIDEwMTczLCAxMDE3NCwgMTAxNzUsIDEwMTc2LCAxMDE3Nywg
MTAxNzgsIDEwMTc5CgoKdHJpYmVzbWFuOi90bXAvcmVpc2VyZnNwcm9ncy0zLjYuMTQvZGVidWdy
ZWlzZXJmcyAjCgoKCk5vdGUsIHRoYXQgdGhpcyB3aWxsIG9ubHkgd29yayBpZiBuYW1lIG9mIGZp
bGUgaXMgZm91bmQuIEtleSBvZiBmaWxlIGlzCm9idGFpbmVkIGZyb20gaXQuCkluIHlvdXIgY2Fz
ZSBpdCBtaWdodCBoYXBwZW4gdGhhdCBuYW1lIHdpbGwgbm90IGJlIGZvdW5kCkJ1dCB5b3Ugc2Vl
bSB0byBrbm93IG9iamVjdGlkPyBBcyB5b3Ugc2FpZCB0aGF0IGZpbGVzIHdlcmUgY3JlYXRlZCBv
bmUKYWZ0ZXIgZWFjaCBvdGhlciBhbmQgeW91IGZvdW5kIG9uZSBvZiBmaWxlcyB3aXRoIG9iamVj
dGlkIDI1NzQuClNvIHlvdSBtaWdodCB0cnkgdG8gZmluZCBtZXRhZGF0YSBvZiBmaWxlcyB3aXRo
IG9iamVjdGlkIDI1NzMgb3IgMjU3NS4KCmV4YW1wbGU6CgpkZWJ1Z3JlaXNlcmZzIC1zIC9kZXYv
aGRhNwpXaGF0IGtleSBkbyB5b3Ugd2FudCB0byBmaW5kOiBkaXJpZD8tMQpvYmplY3RpZD8xNAps
b29raW5nIGZvciAoWzQyOTQ5NjcyOTUgMTRdKQowJS4uLi4yMCUuLi4uNDAlLi4uLjYwJS4uLi44
MCUuLi4uMTAwJSAgICAgICAgICAgICAgICAgICAgICAgIGxlZnQgMCwKNzMwMiAvc2VjCgp0aGlz
IHdpbGwgY3JlYXRlIGEgZmlsZSBzY2FuLmxvZyBjb250YWluaW5nIHNvbWV0aGluZyBsaWtlOgoz
LXRoIGl0ZW0gb2YgYmxvY2sgOTg1MCBpcyBpdGVtIG9mIGZpbGUgWzQyOTQ5NjcyOTUgMTRdOiA1
IDE0IDB4MCBTRAooMCksIGxlbiA0NCwgbG9jYXRpb24gMjY0MCBlbnRyeSBjb3VudCA2NTUzNSwg
ZnNjayBuZWVkIDAsIGZvcm1hdCBuZXcKNC10aCBpdGVtIG9mIGJsb2NrIDk4NTAgaXMgaXRlbSBv
ZiBmaWxlIFs0Mjk0OTY3Mjk1IDE0XTogNSAxNCAweDEgSU5ECigxKSwgbGVuIDM2LCBsb2NhdGlv
biAyNjA0IGVudHJ5IGNvdW50IDAsIGZzY2sgbmVlZCAwLCBmb3JtYXQgbmV3CgpUaGVuIHlvdSBz
aG91bGQgdXNlIGRlYnVncmVpc2VyZnMgLTEgOTg1MCAvZGV2L2hkYTEgdG8gc2VlIGRldGFpbHMg
b2YKNC10aCBpdGVtIG9mIGJsb2NrIDk4NTA6CgpJdCB3aWxsIGdpdmUgeW91IGluZm9ybWF0aW9u
IGFib3V0IGZpbGUgYmxvY2sgbWFwIHNpbWlsYXIgdG8gdGhlIG9uZSBpbgphYm92ZS4KCk9UT0gs
IGlmIHRoZXJlIHdlcmUgbWV0YWRhdGEgb2YgdGhhdCBmaWxlIHdpdGhvdXQgbmFtZSAtIHJlaXNl
cmZzY2sKLS1yZWJ1aWxkLXRyZWUgd291bGQgcHV0IGl0IGludG8gbG9zdCtmb3VuZC4KV2VsbCwg
eW91IG1heSB0cnkgYW55d2F5LiDOzc7Y0MneIC0gzMUgztjQyd4K

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=windows-1251
Content-Disposition: attachment; filename="vs.2"

From: Vladimir Saveliev <vs@namesys.com>
To: Alexy Khrabrov <alexy.khrabrov@setup.org>

Hello

On Fri, 2004-05-28 at 19:32, Alexy Khrabrov wrote:
> Vladimir --
> 
> Almost there!  Looks like it can find it by name.  My debugreiserfs
> has no option -f, I have a version debugreiserfs 3.x.1b (2002).
> Should I build the latest ones?

yes, please do that urgently. ftp.namesys.com/pub/reiserfsprogs

>   The scan told me I have 14 blocks
> for the other file, it preceded 2572_2574, and it said 2571.  Now,
> given I *have* the map, how do I reassemble the blocks?  Spasibo!
> 

suppose you found that file consists of blocks:
10171, 10172, 10173, 10174, 10175, 10176, 10177, 10178, 10179

that means that bytes from 0 to 4095 are in block 10171 (blocksize 4k)
4096 - 8191:	10172
8192 - 12288:	10173
etc

so you have to do something like:

dd if=/dev/hda1 bs=4096 count=1 skip=10171 >> newfile
dd if=/dev/hda1 bs=4096 count=1 skip=10172 >> newfile
dd if=/dev/hda1 bs=4096 count=1 skip=10173 >> newfile
.

the only problem is final filesize. It will be multiple of 4096
if that will be the problem you will have to find a way to truncate
ending 0s.

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=windows-1251
Content-Disposition: attachment; filename="p5270916.jpg.rsfs-v3.6.17.map.1.show"

block 1244, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 1258, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 1262, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 1266, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 1270, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 8142, item 0: 2572 2573 0x0 SD (0), len 44, location 3448 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500
block 1244, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1258, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1262, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1266, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1270, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 8142, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1271, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
57 pointers
[ 2055746(9) 2055756(48)]
block 8002, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
57 pointers
[ 2055746(9) 2055756(48)]

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=windows-1251
Content-Disposition: attachment; filename="p5270917.jpg.rsfs-v3.6.17.map.1.show"

block 1271, item 0: 2572 2574 0x0 SD (0), len 44, location 3824 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3428007, nlink 1, mtime 27/2004 11:38:04 blocks 6696, uid 0
block 8002, item 0: 2572 2574 0x0 SD (0), len 44, location 3824 entry count 65535, fsck need 0, format new
(NEW SD), mode -r-xr--r--, size 3428007, nlink 1, mtime 27/2004 11:38:04 blocks 6696, uid 0
block 1271, item 0: 2572 2574 0x1 IND (1), len 3348, location 476 entry count 0, fsck need 0, format new
837 pointers
[ 2055804(837)]
block 8002, item 0: 2572 2574 0x1 IND (1), len 3348, location 476 entry count 0, fsck need 0, format new
837 pointers
[ 2055804(837)]

--xHFwDpU9dbj6ez1V--
