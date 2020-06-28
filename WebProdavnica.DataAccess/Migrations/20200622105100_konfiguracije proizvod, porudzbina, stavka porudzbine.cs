using Microsoft.EntityFrameworkCore.Migrations;

namespace WebProdavnica.DataAccess.Migrations
{
    public partial class konfiguracijeproizvodporudzbinastavkaporudzbine : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StavkePorudzbine_Porudzbine_PorudzbinaId",
                table: "StavkePorudzbine");

            migrationBuilder.DropForeignKey(
                name: "FK_StavkePorudzbine_Proizvodi_ProizvodId",
                table: "StavkePorudzbine");

            migrationBuilder.AlterColumn<string>(
                name: "Naziv",
                table: "Proizvodi",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "status",
                table: "Porudzbine",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateIndex(
                name: "IX_Proizvodi_Naziv",
                table: "Proizvodi",
                column: "Naziv",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_StavkePorudzbine_Porudzbine_PorudzbinaId",
                table: "StavkePorudzbine",
                column: "PorudzbinaId",
                principalTable: "Porudzbine",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StavkePorudzbine_Proizvodi_ProizvodId",
                table: "StavkePorudzbine",
                column: "ProizvodId",
                principalTable: "Proizvodi",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StavkePorudzbine_Porudzbine_PorudzbinaId",
                table: "StavkePorudzbine");

            migrationBuilder.DropForeignKey(
                name: "FK_StavkePorudzbine_Proizvodi_ProizvodId",
                table: "StavkePorudzbine");

            migrationBuilder.DropIndex(
                name: "IX_Proizvodi_Naziv",
                table: "Proizvodi");

            migrationBuilder.AlterColumn<string>(
                name: "Naziv",
                table: "Proizvodi",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string));

            migrationBuilder.AlterColumn<int>(
                name: "status",
                table: "Porudzbine",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldDefaultValue: 0);

            migrationBuilder.AddForeignKey(
                name: "FK_StavkePorudzbine_Porudzbine_PorudzbinaId",
                table: "StavkePorudzbine",
                column: "PorudzbinaId",
                principalTable: "Porudzbine",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StavkePorudzbine_Proizvodi_ProizvodId",
                table: "StavkePorudzbine",
                column: "ProizvodId",
                principalTable: "Proizvodi",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
