From: "Svetoslav Slavtchev" <svetljo@gmx.de>
Subject: Re: reiser4 as module (reiser4-2004.06.01-17.16-linux-2.6.7-rc1-mm1 )
Date: Thu, 3 Jun 2004 14:34:21 +0200 (MEST)
Message-ID: <18861.1086266061@www24.gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="========GMXBoundary188611086266061"
Return-path: <reiserfs-list-return-18992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--========GMXBoundary188611086266061
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Wed, Jun 02, 2004 at 01:46:09PM +0200, Svetoslav Slavtchev wrote:
> > Hi all,
> > 
> > i'm having problem with unresolved symbols,
> > when compiling the above auto bk-snapshot
> > with reiser4 as module, and i really need 
> > to compile it as module
> > 
> 
> try this fix:
> ========================================
> # This is a BitKeeper generated diff -Nru style patch.
> #
> # ChangeSet
> #   2004/06/03 14:07:30+04:00 zam@crimson.namesys.com 
> #   reiser4_clear_page_dirty: use page->mapping instead of the wrapper.
> # 
> # as_ops.c
> #   2004/06/03 14:07:26+04:00 zam@crimson.namesys.com +1 -1
> #   reiser4_clear_page_dirty: use page->mapping instead of the wrapper.
> # 
> diff -Nru a/as_ops.c b/as_ops.c
> --- a/as_ops.c	Thu Jun  3 14:20:25 2004
> +++ b/as_ops.c	Thu Jun  3 14:20:25 2004
> @@ -72,7 +72,7 @@
>  	struct address_space *mapping;
>  	unsigned long flags;
>  
> -	mapping = page_mapping(page);
> +	mapping = page->mapping;
>  	BUG_ON(mapping == NULL);
>  
>  	read_lock_irqsave(&mapping->tree_lock, flags);
> ========================================
> 

ok,

once again the missing hunks

the pagevec exports are needed only for 2.6.7-rc2+++

best,
svetljo


-- 
"Sie haben neue Mails!" - Die GMX Toolbar informiert Sie beim Surfen!
Jetzt aktivieren unter http://www.gmx.net/info
--========GMXBoundary188611086266061
Content-Type: application/octect-stream; name="reiser4-export-__iget.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reiser4-export-__iget.diff"

LS0tIGEvZnMvaW5vZGUuYwkyMDA0LTA2LTAyIDA4OjE3OjM4LjAwNDcwMDg0MyArMDIwMAorKysg
Yi9mcy9pbm9kZS5jCTIwMDQtMDYtMDIgMDk6NTc6NTkuMTU0MjYxNjUwICswMjAwCkBAIC0yMzQs
NiArMjM0LDcgQEAKIAkJbGlzdF9tb3ZlKCZpbm9kZS0+aV9saXN0LCAmaW5vZGVfaW5fdXNlKTsK
IAlpbm9kZXNfc3RhdC5ucl91bnVzZWQtLTsKIH0KK0VYUE9SVF9TWU1CT0woX19pZ2V0KTsKIAog
LyoqCiAgKiBjbGVhcl9pbm9kZSAtIGNsZWFyIGFuIGlub2RlCg==

--========GMXBoundary188611086266061
Content-Type: application/octect-stream; name="reiser4-export_pagevec_release-and-pagevec_lookup_tag.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reiser4-export_pagevec_release-and-pagevec_lookup_tag.diff"

LS0tIGEvbW0vc3dhcC5jLm9yaWcJMjAwNC0wNi0wMiAwOTozOTo0Ny43MzA4MjIzOTggKzAyMDAK
KysrIGIvbW0vc3dhcC5jCTIwMDQtMDYtMDIgMDk6NTM6MzAuNDE2MDUzMjk0ICswMjAwCkBAIC0y
NTgsNiArMjU4LDcgQEAKIAlyZWxlYXNlX3BhZ2VzKHB2ZWMtPnBhZ2VzLCBwYWdldmVjX2NvdW50
KHB2ZWMpLCBwdmVjLT5jb2xkKTsKIAlwYWdldmVjX3JlaW5pdChwdmVjKTsKIH0KK0VYUE9SVF9T
WU1CT0woX19wYWdldmVjX3JlbGVhc2UpOwogCiAvKgogICogcGFnZXZlY19yZWxlYXNlKCkgZm9y
IHBhZ2VzIHdoaWNoIGFyZSBrbm93biB0byBub3QgYmUgb24gdGhlIExSVQpAQCAtMzg3LDYgKzM4
OCw3IEBACiAJCQkJCW5yX3BhZ2VzLCBwdmVjLT5wYWdlcyk7CiAJcmV0dXJuIHBhZ2V2ZWNfY291
bnQocHZlYyk7CiB9CitFWFBPUlRfU1lNQk9MKHBhZ2V2ZWNfbG9va3VwX3RhZyk7CiAKIAogI2lm
ZGVmIENPTkZJR19TTVAK

--========GMXBoundary188611086266061
Content-Type: application/octect-stream; name="reiser4-20040601-20040602.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reiser4-20040601-20040602.diff"

ZGlmZiAtTmF1cmIgcmVpc2VyNC0yMDA0LjA2LjAxLTE3LjE2LWxpbnV4LTIuNi43LXJjMS1tbTEv
ZnMvcmVpc2VyNC9hc19vcHMuYyByZWlzZXI0LWN1cnJlbnQvZnMvcmVpc2VyNC9hc19vcHMuYwot
LS0gcmVpc2VyNC0yMDA0LjA2LjAxLTE3LjE2LWxpbnV4LTIuNi43LXJjMS1tbTEvZnMvcmVpc2Vy
NC9hc19vcHMuYwkyMDA0LTA2LTAyIDIwOjMwOjU5LjM2OTk4MDAxMCArMDIwMAorKysgcmVpc2Vy
NC1jdXJyZW50L2ZzL3JlaXNlcjQvYXNfb3BzLmMJMjAwNC0wNi0wMyAwMDo0ODoyMi40MzIwNTE1
NDAgKzAyMDAKQEAgLTU2NywxMyArNTY3LDEzIEBACiAKIAkJLyogd2UgYXJlIHVuZGVyIG1lbW9y
eSBwcmVzc3VyZSBzbyByZWxlYXNlIGpub2RlIGFsc28uICovCiAJCWpwdXQobm9kZSk7Ci0JCXJl
YWRfbG9ja19pcnEoJm1hcHBpbmctPnRyZWVfbG9jayk7CisJCXdyaXRlX2xvY2tfaXJxKCZtYXBw
aW5nLT50cmVlX2xvY2spOwogCQkvKiBzaHJpbmtfbGlzdCgpICsgcmFkaXgtdHJlZSAqLwogCQlp
ZiAocGFnZV9jb3VudChwYWdlKSA9PSAyKSB7CiAJCQlfX3JlbW92ZV9mcm9tX3BhZ2VfY2FjaGUo
cGFnZSk7CiAJCQlfX3B1dF9wYWdlKHBhZ2UpOwogCQl9Ci0JCXJlYWRfdW5sb2NrX2lycSgmbWFw
cGluZy0+dHJlZV9sb2NrKTsKKwkJd3JpdGVfdW5sb2NrX2lycSgmbWFwcGluZy0+dHJlZV9sb2Nr
KTsKIAogCQlyZXR1cm4gMTsKIAl9IGVsc2UgewpkaWZmIC1OYXVyYiByZWlzZXI0LTIwMDQuMDYu
MDEtMTcuMTYtbGludXgtMi42LjctcmMxLW1tMS9mcy9yZWlzZXI0L3BsdWdpbi9pdGVtL2V4dGVu
dF9mbHVzaF9vcHMuYyByZWlzZXI0LWN1cnJlbnQvZnMvcmVpc2VyNC9wbHVnaW4vaXRlbS9leHRl
bnRfZmx1c2hfb3BzLmMKLS0tIHJlaXNlcjQtMjAwNC4wNi4wMS0xNy4xNi1saW51eC0yLjYuNy1y
YzEtbW0xL2ZzL3JlaXNlcjQvcGx1Z2luL2l0ZW0vZXh0ZW50X2ZsdXNoX29wcy5jCTIwMDQtMDYt
MDIgMjA6MzA6NTkuOTc0ODQ4ODMwICswMjAwCisrKyByZWlzZXI0LWN1cnJlbnQvZnMvcmVpc2Vy
NC9wbHVnaW4vaXRlbS9leHRlbnRfZmx1c2hfb3BzLmMJMjAwNC0wNi0wMyAwMDo0ODoyMi42NTQ5
OTE0NDUgKzAyMDAKQEAgLTIyNyw2ICsyMjcsOSBAQAogCQkJZ290byBleGl0OwogCQl9CiAKKwkJ
YXNzZXJ0ICgiemFtLTEwNDIiLCAham5vZGVfaXNfZmx1c2hwcmVwcGVkKG5laWdoYm9yKSk7CisJ
CWFzc2VydCAoInphbS0xMDQzIiwgYmxvY2tucl9pc19mYWtlKGpub2RlX2dldF9ibG9jayhuZWln
aGJvcikpKTsKKwogCQlPTl9UUkFDRShUUkFDRV9GTFVTSF9WRVJCLCAidW5hbGxvYyBzY2FuIGlu
ZGV4ICVsdTogJXNcbiIsIHNjYW5faW5kZXgsIGpub2RlX3Rvc3RyaW5nKG5laWdoYm9yKSk7CiAK
IAkJLyogWFhYIGNvbW1lbnRlZCBhc3NlcnRpb24gb3V0LCBiZWNhdXNlIGl0IGlzIGluaGVyZW50
bHkK

--========GMXBoundary188611086266061
Content-Type: application/octect-stream; name="reiser4-swapper_space_fix.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reiser4-swapper_space_fix.diff"

LS0tIGEvZnMvcmVpc2VyNC9hc19vcHMuY34JMjAwNC0wNi0wMyAxMTo1MzoyMi4xMzczOTY4Mjgg
KzAyMDAKKysrIGIvZnMvcmVpc2VyNC9hc19vcHMuYwkyMDA0LTA2LTAzIDEyOjM1OjM5Ljc2MzAx
MDQzMSArMDIwMApAQCAtNzIsNyArNzIsNyBAQAogCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBw
aW5nOwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLQltYXBwaW5nID0gcGFnZV9tYXBwaW5nKHBh
Z2UpOworCW1hcHBpbmcgPSBwYWdlLT5tYXBwaW5nOwogCUJVR19PTihtYXBwaW5nID09IE5VTEwp
OwogCiAJcmVhZF9sb2NrX2lycXNhdmUoJm1hcHBpbmctPnRyZWVfbG9jaywgZmxhZ3MpOwo=

--========GMXBoundary188611086266061--

