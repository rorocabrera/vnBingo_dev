'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "0beb0911c49063c70710c3c1363ccf48",
".git/config": "e5b3a4307c1018e26e8e1ecb7f3b9707",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "2611b35df00055a5be1427ce9d516a5c",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "b1207bed264ffa96c55a721693735e31",
".git/logs/refs/heads/main": "abfadad1dc2432823b2c47b70787c9d3",
".git/logs/refs/remotes/origin/main": "f7cacd66fdb0ebd384e18e6da48f3534",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/0e/6c1dc60212f64ea6427a6d06853a46608cbc46": "700872e638417ef7c374e46a050eec96",
".git/objects/0e/cabe1f70a1b23b2089541343cbe1c92e84a087": "ffd0074f13970ee4c2a00852f09552bf",
".git/objects/0f/2a798d5d4eda243d76c415eb2d7d492443025f": "b041963369241415a4c8456c4ae268cc",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/20/c6be238e2d1e6cab1c35b468dab8a0bbc05fa1": "4d02d66fbd4601f6e282527762f5089c",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/27/42256aa4ad61ef5922ee968a2f93b1f305ea06": "e4b0d36e46d723c869ae3dc1bfa84bac",
".git/objects/29/9d3926d27852db72df22d7f30026e9ed6555cc": "62c8d158e39de1199bcf7ade6159fa14",
".git/objects/2a/8526e5cef0a4a92c8fb291636aa41316af7680": "74e9cc54efcb92e4d11bf4e20d6f637f",
".git/objects/2c/3640c7afc221382add33395dae14108e68f0bf": "6daebc36481722176aac65f60224cab7",
".git/objects/2c/b925306ddb0601ddfc1044125bad2918ea4480": "80e21e2a1e97ecf67acc6f83a63b1418",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/2d/35df4d397fb9af33c179ba159b6345e0984f6b": "342b80bce63ec43729b5f14d80a72cb8",
".git/objects/2d/4e0a4a1337779a0e920c663ddaf53b8ca84941": "f240cafa9b001476346aff191149d54e",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/31/b7872989c08d1fe54db37137d2bfc8b2f68e0d": "77d421b981ba78509a788832ce792f8f",
".git/objects/31/cda498cb078313756293e6312532f86bbb7908": "e3b075dfb444c6c2026508709e8dd74a",
".git/objects/32/aaacc2d66054a610627d383c569ed7932daa06": "473b8f0c4cded0e4ddccd4e827e081da",
".git/objects/33/bde1b484e217dcfa308d762daf5b94ef3b694f": "3a7274f7c83b8e4b48cb46967bb3ebef",
".git/objects/39/53936df46a433e523336e30f94dd5acdaa93a9": "a6afd00affe769d42fc29450e752b653",
".git/objects/39/91e0e5a13fef31d336ad4ac8e6d2f7a0490db4": "667ae53af85f62cb694f87183dc7c727",
".git/objects/3c/669e625035b51dd0b8bb142ec46d352f9992d7": "0be61a5d4f950fbabf63f01c01f32265",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3c/ded747f794cee6bf68ece465522ff27c02d544": "e745fb582c71f6a485f4bde47e0fb2bc",
".git/objects/3d/2fcdccf39e61d35e2e02d5885a0811fcd7de23": "67fe92c9abce24b1f3e390a203fa6eee",
".git/objects/3d/4efdb71c79f3f6d372670e31b218864176e315": "7a92071a93616ac0eda23167acd6aa55",
".git/objects/41/6271fb710ed8242b928d848511a5ee20f60760": "59ec46cfc774bc2a40e515369e05d048",
".git/objects/41/e7d47fe8b6ec7f8be124a0e3346cad1a2d33db": "c303b40574faecb0cbd0b238dd1b20ac",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/47/8f2d0779ab1d3b7d0e7097913072e7ced08bcb": "bc050224a328866deb58fe000dd2f558",
".git/objects/48/c3c53712965322f818245c8fe000d6883ecb89": "0db28bf306ffa6061bef892bbb2c1a72",
".git/objects/4a/953b94afce335d93093fc7af9a8160beed998e": "052d54c37e7d01058eb1cbe679114034",
".git/objects/4e/7464c67f0168a71d4379f414df5d482026fb3d": "46e8a02082f8200710986033464cf403",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/4e/8d8b417b0417a9efdf49ef24be8dbf4a237120": "1d180add9e8a9971b44678a5d5d00fa8",
".git/objects/4f/325ab136d7c06d30bbe239f81f4505dd4ce7c7": "9f4b5bd027b0bcde278c246d6058070c",
".git/objects/52/480a63b1f184ea74afb06662aa98fa98864864": "6f8b2cf71be2b4830601f9db57eded45",
".git/objects/56/b389a1820ccf61bd6f5b74f2961a36b7de24aa": "8a236486097c41f4c49ebfd84a8f175e",
".git/objects/59/bf0b24a51dfca93c17d5fe927c6e3050d2a514": "ed0486afbf6b93f3371904779e0a7c0c",
".git/objects/5b/ff43f14c54d52dbb3423748f6b2d5233742cee": "546b0eb09f2031b26574e81642095f22",
".git/objects/5d/b9e90cee8b187fb9d714978b6a01cb6c2f3491": "e269efbdc94811bd0ab40bbf938cc115",
".git/objects/62/fa1dd7edd5031063c62e4995b3e083b47d28ca": "3694dcea4f808b2fc3c3b249a9f40edc",
".git/objects/65/86edfb6ff15a64e2a351676df39b541a133f1a": "c8db513878b129bf1a80d50bdd8fd759",
".git/objects/65/b384c04ef7ee9fb9b7582b77377280c5d64cd5": "88422bbb2bc42436f8f242eb59c23af7",
".git/objects/68/103cf556565fe525fad236269eea1cc36bef66": "ca266e52ee01e6717bf6f0546170dd6f",
".git/objects/6a/a7b5ea148e1c6f30e0e741c56b2b66b13ee762": "5136a5295de3d6df9b8a536c1ba0f160",
".git/objects/6f/517367231b736892e1e32b6f7457a0544e7688": "1e33a28eed5fe20e65f02b15cf86c68b",
".git/objects/74/d77059eccd41e53625db3336e0d28db5dc1433": "86e0e430a96fe5911fd1bf7da8c21b3d",
".git/objects/75/0b61924504f78b14761193e99a5ff306c86bcb": "d60cca798941dc02790047562308241e",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/76/98b94377cb78c269b81cd391a9e1da6c63951e": "ffe908829234db25d28355466d7e54ff",
".git/objects/79/9255cafd3e07cc1eca35be7a6ed54f738b8a47": "6d2a447a259b7d15655fbba066296e86",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/79/c31b0e22f0bc0e81b3fc21fcc9f317c94d26cc": "4777c74b92ae26b348920fc4120a8652",
".git/objects/7b/a8cca0ebc8723b8e2224091180cd3aff1468c2": "61faccc82f36188c89057c4155182072",
".git/objects/7c/36576c3df25089406c6a7c3c90b5c435f78b57": "e8c9cde74e39d5ac692fc0344291ab63",
".git/objects/7e/cc874adaf365d4a73c6f2a35944da117af6247": "08a699106a159ff706657f031e63bffd",
".git/objects/84/2e51169b3aab15cd8e08ff77a08ff4a3b91c11": "d9787c04f097ea9a0da863eadff71282",
".git/objects/85/2a3cbb23ed4922d3c2c8b81594b08b7fa90202": "fa30bc351ba531f09dcf13df176a6bcf",
".git/objects/87/c4f12f2db083b6214aa6645e4fab6b55213a2e": "e90ace178961fd40fea2b85bf544ec4d",
".git/objects/88/7d7ce1c3872f38f1efb59ce0d38bf33059b6d3": "8515ae0a6b2dd29821c9420b27254f11",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/f5756a3da6749409cb9751d6e02fe02d628d55": "4e6a362ec18d73fd759c4d87398afecb",
".git/objects/8d/d0bedb023f24597ef1c40b67c7e94064bea06d": "bae88488e8e63950534b4f7488e2ba58",
".git/objects/8f/1fff3abfa91a6b8d788dab6e5cbffb04fc4084": "287eb978bdae5503da64aa92ec5a20d3",
".git/objects/99/255dfd262069e7ed0e68f3f3c1057ea2697745": "44551483248cff25522742fa6c420735",
".git/objects/9d/392cc8353d615d1a3c2d42acf9825c899cdcd4": "d7a5a8a64a8ed3eac0cece70f75c53ea",
".git/objects/9d/90e51da2fbb304e25d0f3073ed435d8e7c844a": "48a9fa9caad5370ee84860495f132f59",
".git/objects/9d/fca932d18862c644cdaab0f0b88ee9ee770c51": "ee50309eb77d1ab83cd0fbd5c3100375",
".git/objects/9e/0c67c0bd88bdf9ba633b6691fb726424b742c0": "ec73ecb3056e81fc68b0087deee61923",
".git/objects/9e/a6b89f72d2c9816cbfc0cacd3814110bb921b2": "21fb1e8e971b8c12e481f8446dc876d1",
".git/objects/a0/91b4715eb01404b9c5a4da1b16d141d359c8eb": "ab711088b0a9549fd9890e6ad7d2c275",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a1/3f51f26e7a7376012fa5844725f33e84887ce5": "149a6d266e125faf4c673ccc8ebc2858",
".git/objects/a4/d2b188945600e10204b9a439c28c45eb8f7262": "1b5b6da051ba49166f90fd953158901d",
".git/objects/a5/7f67d533dacbed14956bcc6339837b2e5bf721": "80e3cbb4035276bd27d9ac877a770b63",
".git/objects/a5/ac13deebfac4e9ec5c31b106ee81581567938a": "74176402968e823614f217dab02eed5c",
".git/objects/a6/25b178e5267715049453b9d8c9dd1c5dfbdafe": "babf9a4aa80489692247635fa1a33df4",
".git/objects/a7/ee2333dd0e42fe0bd742667e6f2601f5d4bbc4": "b962a26b22ec3d8d690190639e7f3b0d",
".git/objects/a8/8567ce3efd9c4aafbe91cf91ac7154b9edf974": "da9de92fe6fb0b4e10f24786318972e0",
".git/objects/a8/97ea4bc4729c83d69f902a99f96b62b42da049": "fda1ca80cd54649e32dfa658faea1531",
".git/objects/ac/59f751bc159670188645331f975bb79c25139b": "453c11467ff80f971330c6c4cf177ef7",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/b0/9de9b8a68c8129835b4e7fe729a0baeef6597c": "810c38538510a2bad56916e008214974",
".git/objects/b5/c30c49b393c7064d74bbd484a98ff69c6b909f": "538de1751355c988cd8172d1b27942a3",
".git/objects/b5/fd294272d2a8d1acb6ba2bd903ff7543624217": "27f0c2b7f5adc25ce97bd7acb9b5afc4",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/18fb8915c581ac33213f1f5c102bc579a9c885": "7f7e71133fea5f4a6a4e41ced2ee6346",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/62d1917608c574cb6bd5635bfa986118819bc1": "1d7b582eea2d860fc908aa72e7cb3047",
".git/objects/bb/d29ad9b4f3a81ff84cc53c8fd3d9920a51a0c6": "204a770e9a6f5557729cc89a31cd4090",
".git/objects/bd/c04438f855bdebdaa85bac5b8ff867370eca7e": "f9d84aa7e2181bbddd5d656d62d0c06d",
".git/objects/c3/3eecd264faccc637249e8e6c7a8f8a1363e98f": "5a74c4a49fccddbec763e11d2049f4fa",
".git/objects/c3/a3d3d3283e2313751080267db96ab2f65e7d0a": "473c5069b097732ecb8993aa4ae46815",
".git/objects/c8/bfb84d1fc7f13a06daac9a80183814cac71b2b": "4ff6d2ddd0d04aca99df3585c86b9517",
".git/objects/c9/21a2f498a3b23015e4224b190c27e3a10b4220": "b7425703d6ac210a6cb5304cdf2f7994",
".git/objects/c9/8e49c9aab51c5d0c1a6b90466200400627d827": "4a0ab44cab8deb73e0605e879008938f",
".git/objects/cc/4be491083d7424932e23878cf624e18dfcb360": "b7ca34cad944aebc3366759869433b4d",
".git/objects/ce/a9f7af056f0c4addd99bac57aaf8f4ffa17c78": "80c77270fb408e0b775fb3dfd38e557b",
".git/objects/ce/c94ad118194dd9b87030489d84e25e0b71ac37": "4f407f8ea031cebbd87d5308d39ea0f6",
".git/objects/d3/7e5cca2a6883b98ba4d8c3c7852fc608ea0ecb": "e489d8d80f102b5e0fccc4854ab17267",
".git/objects/d6/901373b89773a82fa6b4d569d4b81b5e8e95cf": "73d5a389f0e3b3a984050158383ab393",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/4a947cfe2bb84a63b1f804ed90dd720aa2ade1": "dac4c0afa0b7c78e672f974593f56fab",
".git/objects/db/ec42d45630541b6f75dcf4939a97276c79ad9e": "389a3be9f3a3dd65be3d1c595f9a4bd9",
".git/objects/df/497802daf7095234ece0f96772a5b498283044": "068a83f0afe4f2eaab017e589e5c8d0c",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e6/1b80ea7c5d2743837cc16abb3bd3e2b77f5cbe": "af4886e7a3d9ee617b41b57d56129fe6",
".git/objects/e7/2c3a74e1099191f0df1047235f7a0e2f424b06": "0b4d27f732deefd5ab3c92e6e91377c6",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/788a528cc49ce24ba11b9c7022880ccd1de6bc": "1295401011e049606f3ab4ec594b3a9d",
".git/objects/ed/f4bc4fb7d6144c0843a44595052957822a89ed": "22d8b374e5524222957824590798a053",
".git/objects/f3/c558236f65a3670da170c5680ef54fc1f420f8": "1d20b60637febf964a5c910e88bb7bd6",
".git/objects/f6/09f69ea52b0634d512dca1833214f30766157c": "1c778b739457768c767255c78a5436c3",
".git/objects/f7/6bcb9c482fa907cb0c52008cddb3597e044dc6": "5c7f795f08951186fd71089bf3eb308a",
".git/objects/fa/77e9b480eab8e56c0a03f9e40b3e33e7262fd8": "e13b4507fdfb87d4d702263a8c84333e",
".git/objects/fb/6948bf129352e6a92169a2a51a40664b20a27c": "a8c45a6e6207bcaa5f4754a0d383b3c3",
".git/objects/fd/38094656698098108e2936f4182278087e6f37": "5bbf1b29fbd70a4e11bbafee47de3613",
".git/objects/fd/ddd1a6a86703f4bc5fc68864a2da2e709b13ea": "19b556b94cbe726c7d9007c4de46bd24",
".git/objects/fe/cb4f00b27c1399cee476b1d7bcd25708ed0643": "05acf01af16b2f55a14f2602cacd588f",
".git/refs/heads/main": "38f16b1a83a0bd0e4e701b5f8007005d",
".git/refs/remotes/origin/main": "38f16b1a83a0bd0e4e701b5f8007005d",
"assets/AssetManifest.json": "64c189e3a799d0818e62682f9a6efdb7",
"assets/assets/audio/1.mp3": "dba012436fdf8bb181d0cb5e46de6fa3",
"assets/assets/audio/10.mp3": "d6ff58f8d738b598cc9bd6d7491e40a9",
"assets/assets/audio/11.mp3": "059adef5c329a33b02150ce354acee16",
"assets/assets/audio/12.mp3": "248e0c027c02bd635fe3cbf3400a2737",
"assets/assets/audio/13.mp3": "1c98c5f4fbdc4457c2bc20ab7d463916",
"assets/assets/audio/14.mp3": "8d92064bfcd34fb56e6abd31c7176104",
"assets/assets/audio/15.mp3": "b365b0c08164c467afd88e5271b808e6",
"assets/assets/audio/16.mp3": "ec599f9776fb036d63b65f57fad1cd4b",
"assets/assets/audio/17.mp3": "c0b43af45a1d2fee028f4c4e3d94fdc9",
"assets/assets/audio/18.mp3": "205bc64ac1c6b649b34a6d7725e7f9b2",
"assets/assets/audio/19.mp3": "5af7a24dfbbe3b7842ca8f326ea76579",
"assets/assets/audio/2.mp3": "342af45a4c75c63df8a11fd1ab4c0420",
"assets/assets/audio/20.mp3": "2ac78a1f2f93d4c4f3abfead69429f57",
"assets/assets/audio/21.mp3": "997f54c47d96cbdb27f7c90e104e516b",
"assets/assets/audio/22.mp3": "dd153fb90866ed0fb003e6100b026e93",
"assets/assets/audio/23.mp3": "c68c8d5b66b1bb2b2be851c4303bf931",
"assets/assets/audio/24.mp3": "7d31e531b29ff66cbc8bbf9b74191095",
"assets/assets/audio/25.mp3": "5269e5e892fa0a67de348a8d5dd66643",
"assets/assets/audio/26.mp3": "8293076ca251acbf6fde0e2c7baf278c",
"assets/assets/audio/27.mp3": "933e97383d7de33ee119abbe7fe6b0f7",
"assets/assets/audio/28.mp3": "cfa7a02a4a5bd77956ac0b1f390b77a2",
"assets/assets/audio/29.mp3": "ad9f88237e7e8da33fe4f027bd3ca337",
"assets/assets/audio/3.mp3": "1c891ea6d4f0941ad32ab5f3fb806b60",
"assets/assets/audio/30.mp3": "12112eb5fbf2d66dbb1fc761d8e601a3",
"assets/assets/audio/31.mp3": "42e18692f8560dca67b93f33526cd962",
"assets/assets/audio/32.mp3": "5d5cb8eb6fbe4de07f3552b7a9db2ca1",
"assets/assets/audio/33.mp3": "4ef2d2397b5eeeb4a2f45ac9547e1d74",
"assets/assets/audio/34.mp3": "7535f99dd7ef0053890eb34162e9cb5e",
"assets/assets/audio/35.mp3": "2ff889cb2ce0b709646de7c4bcf584f2",
"assets/assets/audio/36.mp3": "3bc6e1c54034e91745ea974a8df9257d",
"assets/assets/audio/37.mp3": "40cf93a051c678f0bd4d5281d4c9d26a",
"assets/assets/audio/38.mp3": "ab4287455a630a77fe60317c7a5b8718",
"assets/assets/audio/39.mp3": "ae544ed98d12b2ba429c93da92ba9656",
"assets/assets/audio/4.mp3": "30e016c09209b79f0cd82089b09d8421",
"assets/assets/audio/40.mp3": "02ebc60c9961f4cf55b865286a046ed2",
"assets/assets/audio/41.mp3": "aa13cf3b2771211fce4e74f73ce8568a",
"assets/assets/audio/42.mp3": "5cfccd9cbfaf4a12b1088adbe0e9ad6f",
"assets/assets/audio/43.mp3": "140c1e44674fd1cc832a5864dd67087e",
"assets/assets/audio/44.mp3": "5cd875fb958296f0ce39940a8e64da6c",
"assets/assets/audio/45.mp3": "c6334cff394ae6153d7f3e8e811e7317",
"assets/assets/audio/46.mp3": "be4c954c351a04db3b143c76001d5d11",
"assets/assets/audio/47.mp3": "c6ed4017362c76d8baf918a90f7dc5ae",
"assets/assets/audio/48.mp3": "fec367d6373a69fd8e64346f1d86d882",
"assets/assets/audio/49.mp3": "b62d6878784dea93f2a2fa156dfa602a",
"assets/assets/audio/5.mp3": "03cba75ee588602f644527e6664e6a54",
"assets/assets/audio/50.mp3": "dcad944954702d64a1185ad8b44ed425",
"assets/assets/audio/51.mp3": "107e583df015729979c56838f4b40264",
"assets/assets/audio/52.mp3": "16be5596f2ddd5af32bc4d08ce47cf92",
"assets/assets/audio/53.mp3": "db6e7bc8badbe8caeecb3e8926453795",
"assets/assets/audio/54.mp3": "66a471258ac0163a6cce0726ea3c2478",
"assets/assets/audio/55.mp3": "ddd4d710231c0e29585eb0cd8999a301",
"assets/assets/audio/56.mp3": "8de429a65055ecc0b9dd367499f3436e",
"assets/assets/audio/57.mp3": "07970d68dcaeccf0c25ee56cd24f10cd",
"assets/assets/audio/58.mp3": "2dd928d8eed627cd5a6a8fffb03c0c32",
"assets/assets/audio/59.mp3": "92f9cf3422d24b09fa8ab27fdf35b5dc",
"assets/assets/audio/6.mp3": "56e7c188cd6ebd0131fec99f1f1194a0",
"assets/assets/audio/60.mp3": "32054e839a986932b6f8c04bfcb1f2f6",
"assets/assets/audio/61.mp3": "ce17e182724159ba26ed665a98c96392",
"assets/assets/audio/62.mp3": "d9653796a939228c6a46c39036e44587",
"assets/assets/audio/63.mp3": "2ba6240d95daf8da447a615599734d72",
"assets/assets/audio/64.mp3": "e96856cdede9a0bc8de0ecfa08ea9ca2",
"assets/assets/audio/65.mp3": "19ed4da20c2f4eed823e6ff43bd16694",
"assets/assets/audio/66.mp3": "0369235790adce8c53afb917ce7a335d",
"assets/assets/audio/67.mp3": "de1aedb2defd59ad989dac9612d45735",
"assets/assets/audio/68.mp3": "6237ce5f73c6bd93515eaf304f819b6b",
"assets/assets/audio/69.mp3": "a2579860c73537cc33140cbbf9064abc",
"assets/assets/audio/7.mp3": "7c764d6347d5f5bd16bcfa8874a996aa",
"assets/assets/audio/70.mp3": "a4e86c6e77414866bb37e54801ed67f7",
"assets/assets/audio/71.mp3": "5179a0ce0479c87aecb09bdf5997d659",
"assets/assets/audio/72.mp3": "41c342f4db1160e73aa29b3aa0a4ee3a",
"assets/assets/audio/73.mp3": "f0e34b82a6c8454761e5378c10a646da",
"assets/assets/audio/74.mp3": "57b701f1299b66d1913866f4f89412ed",
"assets/assets/audio/75.mp3": "747b83b6e5a3c3fdacbe3e12e11a5a0b",
"assets/assets/audio/8.mp3": "573739cd50dd48e55f0c9b873a1a13e9",
"assets/assets/audio/9.mp3": "18e690d8c67e8e7a0bcafe36ac44e666",
"assets/assets/vnbingo_logo_1.svg": "56f15a284d394bc82c9186de172ed7a9",
"assets/assets/vnbingo_logo_2.svg": "58430b99b9edb0d49ee35355b8d853b7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "61fc65bfa61ff62ade806ce456882857",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8cb30cf515da5bf8a8ad320a307047e8",
"/": "8cb30cf515da5bf8a8ad320a307047e8",
"main.dart.js": "854a101ccb5dd6d09b38c963105a6c73",
"manifest.json": "57874d9867ab92a8178c17fb3930e5ee",
"version.json": "fe0a7682b022fa097b987b0f3587b538"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
